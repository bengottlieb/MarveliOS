//
//  MV_Store.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Store.h"


@interface MV_Store ()
@property (nonatomic, strong) NSManagedObjectContext *moc;
@property (nonatomic, strong) NSURL *contextURL;
@end

@implementation MV_Store
SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(MV_Store, store);
- (id) init {
	if (self = [super init]) {
		self.contextURL = [[NSURL fileURLWithPath: NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject] URLByAppendingPathComponent: @"MarveliOS.db"];
	}
	return self;
}


- (NSManagedObjectContext *) moc {
	if (_moc == nil) {
		NSDictionary						*options = @{ NSMigratePersistentStoresAutomaticallyOption: @true, NSInferMappingModelAutomaticallyOption: @true };
		NSError								*error = nil;
		
		if (![[NSFileManager defaultManager] createDirectoryAtURL: self.contextURL.URLByDeletingLastPathComponent withIntermediateDirectories: YES attributes: nil error: &error]) {
			return nil;
		}
		
		NSManagedObjectModel				*model = [NSManagedObjectModel mergedModelFromBundles: nil];
		NSPersistentStoreCoordinator		*coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
		[coordinator addPersistentStoreWithType: NSSQLiteStoreType configuration: nil URL: self.contextURL options: options error: &error];
				
		_moc = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
		[_moc setPersistentStoreCoordinator: coordinator];
	}
	return _moc;
}

@end
