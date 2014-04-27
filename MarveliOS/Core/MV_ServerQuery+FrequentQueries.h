//
//  MV_ServerQuery+FrequentQueries.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_ServerQuery.h"

@interface MV_ServerQuery (FrequentQueries)

+ (MV_ServerQuery *) queryForObjectsOfType: (MV_Object_type) type withSearchText: (NSString *) text;
+ (MV_ServerQuery *) queryForAllObjectsOfType: (MV_Object_type) type;

@end
