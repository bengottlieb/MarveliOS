//
//  MV_ServerQuery+FrequentQueries.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_ServerQuery+FrequentQueries.h"

@implementation MV_ServerQuery (FrequentQueries)

+ (MV_ServerQuery *) queryForObjectsOfType: (MV_Object_type) type withSearchText: (NSString *) text {
	NSString				*fragment = nil;
	NSDictionary			*params = nil;
	
	text = [text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	switch (type) {
		case MV_Object_type_character: fragment = @"characters"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_creator: fragment = @"creators"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_event: fragment = @"events"; if (text.length) params = @{ @"nameStartsWith": text }; break;
		case MV_Object_type_series: fragment = @"series"; if (text.length) params = @{ @"titleStartsWith": text }; break;
		case MV_Object_type_story: fragment = @"story"; break;
		case MV_Object_type_comic: fragment = @"comic"; break;
		default:
			return nil;
	}
	
	MV_ServerQuery		*query = [self queryWithFragment: fragment andParameters: params];
	
	query.objectServerType = type;
	return query;
}

+ (MV_ServerQuery *) queryForAllObjectsOfType: (MV_Object_type) type {
	MV_ServerQuery		*query = [self queryForObjectsOfType: type withSearchText: nil];
	
	query.numberToFetch = 100;//MV_QUERY_FETCH_ALL;
	return query;
}
@end
