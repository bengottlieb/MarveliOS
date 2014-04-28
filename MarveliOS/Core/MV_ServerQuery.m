//
//  MV_ServerQuery.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_ServerQuery.h"
#import "MV_DownloadManager.h"
#import "MV_Store.h"

@interface MV_ServerQuery ()
@property (nonatomic, strong) NSString *fragment;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSMutableArray *collectedResults, *collectedIDs;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSString *attributionText, *attributionHTML, *copyright, *etag;
@property (nonatomic, readwrite) unsigned long count, total, offset;
@property (nonatomic, copy) mv_queryCompletedBlock completion;
@end

@implementation MV_ServerQuery

+ (instancetype) queryWithFragment: (NSString *) fragment andParameters: (NSDictionary *) params {
	MV_ServerQuery				*query = [self new];
	
	query.fragment = fragment;
	query.parameters = params;
	query.cacheResults = YES;
	query.numberToFetch = 20;
	query.relatedObjectDepth = 1;
	
	#if DEBUG
		query.progressBlock = ^(CGFloat progress) { NSLog(@"%.1f%%", progress * 100.0); };
	#endif
	
	return query;
}

- (MV_ServerQuery *) fetchWithCompletion: (mv_queryCompletedBlock) completion {
	if (self.cacheResults)
		self.collectedIDs = [NSMutableArray array];
	else
		self.collectedResults = [NSMutableArray array];
	self.completion = completion;
	
	[self continueFetch];
	return self;
}

- (void) continueFetch {
	[[MV_DownloadManager defaultManager] downloadJSON: self.URL withCompletion:^(NSDictionary *results, NSError *error) {
		if (results) {
			self.attributionText = results[@"attributionText"];
			self.attributionHTML = results[@"attributionHTML"];
			self.copyright = results[@"copyright"];
			self.total = [results[@"data"][@"total"] integerValue];
			self.etag = results[@"etag"];
			if (!self.fetchAll && self.total < self.numberToFetch) self.numberToFetch = self.total;
			
			NSArray				*chunkResults = results[@"data"][@"results"];
			
			if (!self.cacheResults) [self.collectedResults addObjectsFromArray: chunkResults];
			self.count += chunkResults.count;
			
			if (self.cacheResults && self.objectServerType != MV_Object_type_none)
				[[MV_Store store] importServerObjects: chunkResults ofType: self.objectServerType toDepth: self.relatedObjectDepth withCompletion: ^(NSArray *importedIDs) {
					if (self.progressBlock) self.progressBlock( ((float) self.collectedIDs.count) / ((float) (self.fetchAll ? self.total : self.numberToFetch)) );
					[self.collectedIDs addObjectsFromArray: importedIDs];
				}];
			
			if (self.count < self.numberToFetch && self.count < self.total) {
				self.offset = self.count;
				
				
				[self continueFetch];
			} else {
				[[MV_Store store] performBlockInMOCContext:^(NSManagedObjectContext *moc) {
					self.completion(error);
				}];
			}
		} else
			self.completion(error);
	}];
}

- (NSArray *) resultDictionaries { return self.collectedResults; }
- (NSArray *) resultIDs { return self.collectedIDs; }

- (NSURL *) URL {
	NSMutableDictionary		*params = self.parameters ? self.parameters.mutableCopy : [NSMutableDictionary dictionary];

	params[@"limit"] = @(self.fetchAll ? 100 : MIN(100, self.numberToFetch));
	if (self.offset) params[@"offset"] = [NSString stringWithFormat: @"%ld", self.offset];
	
	return [[MV_DownloadManager defaultManager] paramaterizeURL: [[MV_DownloadManager defaultManager] URLForFragment: self.fragment] withParameters: params];
}

- (BOOL) fetchAll { return self.numberToFetch == MV_QUERY_FETCH_ALL; }

//=============================================================================================================================
#pragma mark Query factories
+ (MV_ServerQuery *) queryForObjectsOfType: (MV_Object_type) type withSearchText: (NSString *) text {
	NSString				*fragment = nil;
	NSDictionary			*params = nil;
	
	text = [text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	switch (type) {
		case MV_Object_type_character: fragment = @"characters"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_creator: fragment = @"creators"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_event: fragment = @"events"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_series: fragment = @"series"; if (text.length) params = @{ @"titleStartsWith": text }; break;
		case MV_Object_type_story: fragment = @"stories"; break;
		case MV_Object_type_comic: fragment = @"comics"; break;
		default:
			return nil;
	}
	
	MV_ServerQuery		*query = [self queryWithFragment: fragment andParameters: params];
	
	query.objectServerType = type;
	return query;
}

+ (MV_ServerQuery *) queryForAllObjectsOfType: (MV_Object_type) type {
	MV_ServerQuery		*query = [self queryForObjectsOfType: type withSearchText: nil];
	
	query.numberToFetch = MV_QUERY_FETCH_ALL;
	return query;
}

@end

