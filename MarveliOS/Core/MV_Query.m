//
//  MV_Query.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query.h"
#import "MV_DownloadManager.h"
#import <CommonCrypto/CommonDigest.h>

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
	[[MV_DownloadManager defaultManager] downloadRequest: self.request withCompletion:^(NSDictionary *results, NSError *error) {
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
				self.completion(error);
			}
		} else
			self.completion(error);
	}];
}

- (NSArray *) results { return self.collectedResults; }

- (NSURLRequest *) request {
	if ([MV_DownloadManager defaultManager].privateAPIKey.length == 0 || [MV_DownloadManager defaultManager].publicAPIKey.length == 0) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[UIAlertView showAlertWithTitle: @"Missing API Keys" message: @"Please set the publicAPIKey and privateAPIKey property on [MV_DownloadManager defaultManager]."];
		});
		return nil;
	}
	unsigned long			timeStamp = [MV_DownloadManager defaultManager].timeStamp++;
	NSString				*hashBase = [NSString stringWithFormat: @"%ld%@%@", timeStamp, [MV_DownloadManager defaultManager].privateAPIKey, [MV_DownloadManager defaultManager].publicAPIKey];
	NSString				*hash = [self md5ForString: hashBase];
	NSMutableDictionary		*fullQuery = self.parameters ? self.parameters.mutableCopy : [NSMutableDictionary dictionary];
	NSURLComponents			*components = [NSURLComponents componentsWithURL: BASE_API_ENDPOINT resolvingAgainstBaseURL: NO];
	
	fullQuery[@"ts"] = [NSString stringWithFormat: @"%ld", timeStamp];
	fullQuery[@"hash"] = hash;
	fullQuery[@"limit"] = @(self.fetchAll ? 100 : MIN(100, self.fetchCount));
	fullQuery[@"apikey"] = [MV_DownloadManager defaultManager].publicAPIKey;
	if (self.offset) fullQuery[@"offset"] = [NSString stringWithFormat: @"%ld", self.offset];
	
	NSMutableString			*queryString = [NSMutableString string];
	for (NSString *key in fullQuery) {
		[queryString appendFormat: @"%@=%@&", key, fullQuery[key]];
	}
	
	components.query = queryString;
	components.path = [[NSString stringWithFormat: @"/v%d/public/", [MV_DownloadManager defaultManager].apiVersion] stringByAppendingPathComponent: self.fragment];
	
	NSURL					*url = components.URL;
 	return [NSURLRequest requestWithURL: url];
}

- (BOOL) fetchAll { return self.fetchCount == MV_QUERY_FETCH_ALL; }

- (NSString *) md5ForString: (NSString *) string {
	const char			*ptr = [string UTF8String];
	unsigned char		md5Buffer[CC_MD5_DIGEST_LENGTH];
	
	CC_MD5(ptr, strlen(ptr), md5Buffer);
	
	NSMutableString		*output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[output appendFormat:@"%02x", md5Buffer[i]];
	}
	return output;
}


@end

