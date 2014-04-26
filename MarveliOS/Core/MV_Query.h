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
@property (nonatomic) long offset;

@property (nonatomic, readonly) NSArray *results;
@property (nonatomic, readonly) NSString *attributionText, *attributionHTML, *copyright;
@property (nonatomic, readonly) NSUInteger count, total;



- (MV_Query *) fetch: (NSUInteger) count withCompletion: (mv_queryCompletedBlock) completion;

@end
