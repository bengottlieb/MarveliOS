//
//  MV_Query+FrequentQueries.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query.h"

typedef NS_ENUM(NSUInteger, MV_Query_result_type) {
	MV_Query_result_type_character,
	MV_Query_result_type_comic,
	MV_Query_result_type_creator,
	MV_Query_result_type_event,
	MV_Query_result_type_series,
	MV_Query_result_type_story
};

@interface MV_Query (FrequentQueries)

+ (MV_Query *) queryForResultType: (MV_Query_result_type) type withSearchText: (NSString *) text;

@end
