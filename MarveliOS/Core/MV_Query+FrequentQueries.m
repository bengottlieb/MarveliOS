//
//  MV_Query+FrequentQueries.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Query+FrequentQueries.h"

@implementation MV_Query (FrequentQueries)

+ (MV_Query *) queryForResultType: (MV_Query_result_type) type withSearchText: (NSString *) text {
	NSString				*fragment = nil;
	NSDictionary			*params = nil;
	
	switch (type) {
		case MV_Query_result_type_character: fragment = @"characters"; params = @{ @"nameStartsWith": text }; break;
		case MV_Query_result_type_comic: return nil;			//can't search by string
		case MV_Query_result_type_creator: fragment = @"creators"; params = @{ @"nameStartsWith": text }; break;
		case MV_Query_result_type_event: fragment = @"events"; params = @{ @"nameStartsWith": text }; break;
		case MV_Query_result_type_series: fragment = @"series"; params = @{ @"titleStartsWith": text }; break;
		case MV_Query_result_type_story: return nil;			//can't search by string;
	}
	
	return [self queryWithFragment: fragment andParameters: params];
}

@end
