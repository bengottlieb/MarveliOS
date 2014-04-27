//
//  MV_Store.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_Store.h"
#import "NSManagedObjectContext+MV_.h"

#import "MVM_Character.h"
#import "MVM_Comic.h"
#import "MVM_Creator.h"
#import "MVM_Event.h"
#import "MVM_Series.h"
#import "MVM_Story.h"

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

- (void) importServerObjects: (NSArray *) serverObjects ofType: (MV_Object_type) type withCompletion: (mv_importCompletionBlock) completion {
	Class				objectClass = [MV_Store classForObjectType: type];
	
	[self performBlockInMOCContext: ^(NSManagedObjectContext *moc) {
		NSMutableArray			*objectIDs = [NSMutableArray new];
		
		for (NSDictionary *serverObject in serverObjects) {
			MVM_Object			*object = [objectClass findObjectMatching: serverObject inContext: moc];
			
			if (object == nil) object = [moc mv_insertNewEntityWithName: [objectClass entityName]];
			[object importServerObject: serverObject];
			[objectIDs addObject: object.objectID];
		}
		
		NSError				*error = nil;
		
		[moc save: &error];
		if (completion) completion(objectIDs);
	}];
}



//================================================================================================================
#pragma mark Utilities
- (void) performBlockInMOCContext: (mv_contextBlock) block {
	[self.moc performBlock: ^{
		block(self.moc);
	}];
}

+ (Class) classForObjectType: (MV_Object_type) type {
	switch (type) {
		case MV_Object_type_character: return [MVM_Character class];
		case MV_Object_type_comic: return [MVM_Comic class];
		case MV_Object_type_creator: return [MVM_Creator class];
		case MV_Object_type_event: return [MVM_Event class];
		case MV_Object_type_series: return [MVM_Series class];
		case MV_Object_type_story: return [MVM_Story class];
		case MV_Object_type_none: return nil;
			
	}
}

@end
