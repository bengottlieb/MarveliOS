//
//  MV_Query+FrequentQueries.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query+FrequentQueries.h"

@implementation MV_Query (FrequentQueries)

+ (MV_Query *) queryForResultType: (MV_Object_type) type withSearchText: (NSString *) text {
	NSString				*fragment = nil;
	NSDictionary			*params = nil;
	
	switch (type) {
		case MV_Object_type_character: fragment = @"characters"; params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_creator: fragment = @"creators"; params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_event: fragment = @"events"; params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_series: fragment = @"series"; params = @{ @"titleStartsWith": text }; break;
		case MV_Object_type_story:
		case MV_Object_type_comic:
		default:
			return nil;
	}
	
	MV_Query		*query = [self queryWithFragment: fragment andParameters: params];
	
	query.objectServerType = type;
	return query;
}

@end
