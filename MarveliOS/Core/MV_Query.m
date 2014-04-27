//
//  MV_Query.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query.h"
#import "MV_DownloadManager.h"
#import "MV_Store.h"

@interface MV_Query ()
@property (nonatomic, strong) NSString *fragment;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSMutableArray *collectedResults;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSString *attributionText, *attributionHTML, *copyright, *etag;
@property (nonatomic, readwrite) NSUInteger count, total, fetchCount;
@property (nonatomic, copy) mv_queryCompletedBlock completion;
@end

@implementation MV_Query

+ (instancetype) queryWithFragment: (NSString *) fragment andParameters: (NSDictionary *) params {
	MV_Query				*query = [self new];
	
	query.fragment = fragment;
	query.parameters = params;
	query.cacheResults = YES;
	return query;
}

- (MV_Query *) fetch: (NSUInteger) count withCompletion: (mv_queryCompletedBlock) completion {
	self.collectedResults = [NSMutableArray array];
	self.fetchCount = count;
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
			if (!self.fetchAll && self.total < self.fetchCount) self.fetchCount = self.total;
			
			[self.collectedResults addObjectsFromArray: results[@"data"][@"results"]];
			self.count = self.results.count;
			
			if (self.count < self.fetchCount && self.count < self.total) {
				self.offset = self.count;
				
				
				if (self.progressBlock) self.progressBlock( ((float) self.count) / ((float) (self.fetchAll ? self.total : self.fetchCount)) );
				[self continueFetch];
			} else {
				if (self.cacheResults && self.objectServerType != MV_Object_type_none)
					[[MV_Store store] importServerObjects: self.results ofType: self.objectServerType withCompletion: ^(NSArray *importedObjectIDs) {
						self.completion(error);
					}];
				else
					self.completion(error);
			}
		} else
			self.completion(error);
	}];
}

- (NSArray *) results { return self.collectedResults; }

- (NSURL *) URL {
	NSMutableDictionary		*params = self.parameters ? self.parameters.mutableCopy : [NSMutableDictionary dictionary];

	params[@"limit"] = @(self.fetchAll ? 100 : MIN(100, self.fetchCount));
	if (self.offset) params[@"offset"] = [NSString stringWithFormat: @"%ld", self.offset];
	
	return [[MV_DownloadManager defaultManager] paramaterizeURL: [[MV_DownloadManager defaultManager] URLForFragment: self.fragment] withParameters: self.parameters];
}

- (BOOL) fetchAll { return self.fetchCount == MV_QUERY_FETCH_ALL; }


@end

