//
//  NSManagedObjectContext+MV_.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "NSManagedObjectContext+MV_.h"

@implementation NSManagedObjectContext (MV_)

- (NSFetchRequest *) mv_fetchRequestWithEntityName: (NSString *) entityName predicate: (NSPredicate *) predicate sortBy: (NSArray *) sortBy fetchLimit: (int) fetchLimit {
	NSEntityDescription				*entityDescription = [NSEntityDescription entityForName: entityName inManagedObjectContext: self];
	
	if (entityDescription == nil) {
		NSLog(@"Trying to fetch an unknown entity: %@", entityName);
		return nil;
	}
	
	NSFetchRequest					*request = [[NSFetchRequest alloc] init];

	[request setEntity: entityDescription];
	if (predicate) [request setPredicate: predicate];
	if (sortBy) [request setSortDescriptors: sortBy];
	if (fetchLimit) [request setFetchLimit: fetchLimit];
	
	return request;
}

- (id) mv_anyObjectOfType: (NSString *) entityName matchingPredicate: (NSPredicate *) predicate {
	NSFetchRequest					*request = [self mv_fetchRequestWithEntityName: entityName predicate: predicate sortBy: nil fetchLimit: 1];
	NSError							*error = nil;
	NSArray							*results = nil;
	
	results = [self executeFetchRequest: request error: &error];
	
	return (results.count) ? results.firstObject : nil;
}

- (id) mv_insertNewEntityWithName: (NSString *) name {
	return [NSEntityDescription insertNewObjectForEntityForName: name inManagedObjectContext: self];
}

@end
