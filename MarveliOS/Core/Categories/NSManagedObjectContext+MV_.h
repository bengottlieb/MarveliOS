//
//  NSManagedObjectContext+MV_.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (MV_)

- (NSFetchRequest *) mv_fetchRequestWithEntityName: (NSString *) entityName predicate: (NSPredicate *) predicate sortBy: (NSArray *) sortBy fetchLimit: (int) fetchLimit;
- (id) mv_anyObjectOfType: (NSString *) entityName matchingPredicate: (NSPredicate *) predicate;
- (NSArray *) mv_allObjectsOfType: (NSString *) entityName matchingPredicate: (NSPredicate *) predicate;
- (NSUInteger) mv_numberOfObjectsOfType: (NSString *) entityName matchingPredicate: (NSPredicate *) predicate;
- (id) mv_insertNewEntityWithName: (NSString *) name;
@end
