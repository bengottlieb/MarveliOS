//
//  MV_Query.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


#define		MV_QUERY_FETCH_ALL			(-1)

@interface MV_Query : NSObject

+ (instancetype) queryWithFragment: (NSString *) fragment andParameters: (NSDictionary *) params;

@property (nonatomic, copy) mv_progressBlock progressBlock;
@property (nonatomic) long numberToFetch;
@property (nonatomic) NSUInteger relatedObjectDepth;			//how deeply should we follow links to download related objects. Defaults to 1, just download the objects, no related downloads
																//NOTE: You can VERY quickly bust your API limit using values greater than 1 here.

@property (nonatomic, readonly) NSArray *results;
@property (nonatomic, readonly) NSString *attributionText, *attributionHTML, *copyright;
@property (nonatomic, readonly) unsigned long count, total;
@property (nonatomic) BOOL cacheResults;
@property (nonatomic) MV_Object_type objectServerType;


- (MV_Query *) fetchWithCompletion: (mv_queryCompletedBlock) completion;

@end
