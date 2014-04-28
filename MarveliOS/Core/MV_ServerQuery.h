//
//  MV_ServerQuery.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


#define		MV_QUERY_FETCH_ALL			(-1)

@interface MV_ServerQuery : NSObject

+ (instancetype) queryWithFragment: (NSString *) fragment andParameters: (NSDictionary *) params;

+ (MV_ServerQuery *) queryForObjectsOfType: (MV_Object_type) type withSearchText: (NSString *) text;
+ (MV_ServerQuery *) queryForAllObjectsOfType: (MV_Object_type) type;

@property (nonatomic, copy) mv_progressBlock progressBlock;
@property (nonatomic) long numberToFetch;
@property (nonatomic) NSUInteger relatedObjectDepth;			//how deeply should we follow links to download related objects. Defaults to 1, just download the objects, no related downloads
																//NOTE: You can VERY quickly bust your API limit using values greater than 1 here.

@property (nonatomic, readonly) NSArray *resultDictionaries;	//if cacheResults is set to false, this will contain an array of NSDictionaries with the query results
@property (nonatomic, readonly) NSArray *resultIDs;				//otherwise (cacheResults == true), this will have the objectIDs of all retrieved records (whether new or not)
@property (nonatomic, readonly) NSString *attributionText, *attributionHTML, *copyright;
@property (nonatomic, readonly) unsigned long count, total;
@property (nonatomic) BOOL cacheResults;
@property (nonatomic) MV_Object_type objectServerType;


- (MV_ServerQuery *) fetchWithCompletion: (mv_queryCompletedBlock) completion;

@end
