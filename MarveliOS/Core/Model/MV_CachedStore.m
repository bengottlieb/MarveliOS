//
//  MV_CachedStore.m
//  TimeLine
//
//  Created by Ben Gottlieb on 4/29/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_CachedStore.h"

@interface MV_CachedStore ()
@property (nonatomic, strong) NSURL *cacheSourceURL, *copiedCacheURL;
@property (nonatomic, strong) NSManagedObjectContext *readonlyMOC;
@end

@implementation MV_CachedStore
SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(MV_CachedStore, defaultCache);

+ (void) setCacheLocation: (NSURL *) url {
	[self defaultCache].cacheSourceURL = url;
}



//================================================================================================================
#pragma mark Properties
- (void) setCacheSourceURL: (NSURL *) cacheURL {
	if ([cacheURL isEqual: _cacheSourceURL]) return;
	
	self.copiedCacheURL = [[NSURL fileURLWithPath: NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject] URLByAppendingPathComponent: cacheURL.lastPathComponent];
	_cacheSourceURL = cacheURL;
	
	if (![[NSFileManager defaultManager] fileExistsAtPath: self.copiedCacheURL.path]) {
		NSError				*error = nil;
		
		[[NSFileManager defaultManager] copyItemAtURL: self.cacheSourceURL toURL: self.copiedCacheURL error: &error];
	}
	self.readonlyMOC = nil;
}

- (NSManagedObjectContext *) moc {
	return self.readonlyMOC;
}

- (NSManagedObjectContext *) readonlyMOC {
	if (_readonlyMOC == nil && self.copiedCacheURL != nil) {
//		NSMutableDictionary *pragmaOptions = [NSMutableDictionary dictionary];
//		[pragmaOptions setObject:@"DELETE" forKey:@"journal_mode"];
//		
//		NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, pragmaOptions, NSSQLitePragmasOption, nil];
//		[_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]

		NSDictionary						*options = @{ NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"} };
		NSError								*error = nil;
		NSURL								*modelURL = [[NSBundle mainBundle] URLForResource: @"MarveliOS" withExtension: @"momd"];
		NSManagedObjectModel				*model = [[NSManagedObjectModel alloc] initWithContentsOfURL: modelURL];
		NSPersistentStoreCoordinator		*coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
		
		[coordinator addPersistentStoreWithType: NSSQLiteStoreType configuration: nil URL: self.copiedCacheURL options: options error: &error];
		
		_readonlyMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
		[_readonlyMOC setPersistentStoreCoordinator: coordinator];
	}
	return _readonlyMOC;
}

- (void) contextDidSaveChanges: (NSNotification *) note { }

@end
