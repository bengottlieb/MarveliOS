//
//  MV_Query+FrequentQueries.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query.h"

@interface MV_Query (FrequentQueries)

+ (MV_Query *) queryForResultType: (MV_Object_type) type withSearchText: (NSString *) text;

@end
