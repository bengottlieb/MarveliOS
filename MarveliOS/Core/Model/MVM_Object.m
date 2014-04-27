#import "MVM_Object.h"
#import "NSManagedObjectContext+MV_.h"

#import "MVM_Image.h"

#import "MVM_Series.h"
#import "MVM_Story.h"
#import "MVM_Character.h"
#import "MVM_Comic.h"
#import "MVM_Event.h"
#import "MVM_Creator.h"
#import "MV_DownloadManager.h"
#import "MV_Store.h"

#import <objc/message.h>

static NSMutableSet			*s_pendingUpdates = nil;

@interface MVM_Object ()

// Private interface goes here.

@end


@implementation MVM_Object
- (MV_Object_type) objectType { return MV_Object_type_none; }

+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc {
	NSNumber				*apiId = serverObject.mv_apiId;

	if (apiId == nil) return nil;
	return [moc mv_anyObjectOfType: [self entityName] matchingPredicate: [NSPredicate predicateWithFormat: @"apiId == %@", apiId]];
}

+ (instancetype) importServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth intoContext: (NSManagedObjectContext *) moc {
	MVM_Object			*object = [[self class] findObjectMatching: serverObject inContext: moc];
	
	if (object == nil) object = [moc mv_insertNewEntityWithName: [[self class] entityName]];
	[object updateFromServerObject: serverObject toDepth: depth];
	
	return object;
}

+ (NSString *) entityName { return @"";}

- (void) updateFromServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth {
	NSDictionary				*props = self.entity.propertiesByName;
	BOOL						partialImport = (serverObject[@"id"] == nil);
	
	self[@"partialImport"] = @(partialImport);
	
	self[@"apiId"] = serverObject.mv_apiId;
	
	for (NSString *key in serverObject) {
		NSString					*field = [self convertServerFieldToObjectField: key];
		NSAttributeDescription		*desc = props[field];
		id							value = serverObject[key];
		
		if (value == [NSNull null]) value = nil;
		
		if (desc == nil) continue;
		
		if ([desc isKindOfClass: [NSAttributeDescription class]]) {
			switch (desc.attributeType) {
				case NSDateAttributeType:
					break;
					
				case NSStringAttributeType:
					self[field] = [value isKindOfClass: [NSString class]] ? value : [NSString stringWithFormat: @"%@", value];
					break;
					
				default:
					self[field] = value;
					break;
			}
		} else {
			NSString			*importer = [NSString stringWithFormat: @"import%@:toDepth:", [field capitalizedString]];
			SEL					sel = NSSelectorFromString(importer);
			
			_Pragma("clang diagnostic push") \
			_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
			if ([self respondsToSelector: sel]) //[self performSelector: sel withObject: serverObject[key]];
				objc_msgSend(self, sel, value, @(depth));
			_Pragma("clang diagnostic pop") \
		}
	}
	
	if (depth > 0 && partialImport && self[@"resourceURI"]) {
		[self fetchUpdateFromServerToDepth: depth - 1];
	}
}

- (void) fetchUpdateFromServerToDepth: (NSUInteger) depth {
	if (s_pendingUpdates == nil) s_pendingUpdates = [NSMutableSet new];
	
	NSNumber				*hash = @([self[@"resourceURI"] hash]);
	
	if ([s_pendingUpdates containsObject: hash]) return;		//already queued
	
	[s_pendingUpdates addObject: hash];
	
	NSURL				*url = [[MV_DownloadManager defaultManager] paramaterizeURL: [NSURL URLWithString: self[@"resourceURI"]] withParameters: nil];
	
	[[MV_DownloadManager defaultManager] downloadJSON: url withCompletion:^(NSDictionary *results, NSError *error) {
		[[MV_Store store] importServerObjects: results[@"data"][@"results"] ofType: self.objectType toDepth: depth - 1 withCompletion: nil];
		[s_pendingUpdates removeObject: hash];
	}];
}


//================================================================================================================
#pragma mark Importers
- (void) importThumbnail: (NSDictionary *) info toDepth: (NSNumber *) depth {
	MVM_Image			*thumbnail = self[@"thumbnail"];
	
	if ([thumbnail.path isEqual: info[@"path"]]) return;		//already in there
	
	if (thumbnail) [self.managedObjectContext deleteObject: thumbnail];
	
	thumbnail = [self.managedObjectContext mv_insertNewEntityWithName: [MVM_Image entityName]];
	thumbnail.path = info[@"path"];
	thumbnail.extension = info[@"extension"];
	self[@"thumbnail"] = thumbnail;
}

- (void) importImages: (NSDictionary *) imagesInfo toDepth: (NSNumber *) depth {
	NSMutableSet				*existingImages = [self mutableSetValueForKey: @"images"];
	NSSet						*existingPaths = [existingImages valueForKey: @"path"];
	NSMutableArray				*incomingPaths = [[imagesInfo valueForKey: @"path"] mutableCopy];
	
	for (MVM_Image *image in existingImages.copy) {			//delete any images no longer attached
		if (![incomingPaths containsObject: image[@"path"]]) {
			[existingImages removeObject: image];
			[self.managedObjectContext deleteObject: image];
		}
	}
	
	for (NSDictionary *info in imagesInfo) {
		if (![existingPaths containsObject: info[@"path"]]) {
			MVM_Image			*image = [self.managedObjectContext mv_insertNewEntityWithName: [MVM_Image entityName]];
			image.path = info[@"path"];
			image.extension = info[@"extension"];
			[existingImages addObject: image];
		}
	}
}

- (void) importSeries: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"series"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Series		*series = [MVM_Series importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (series) [existing addObject: series];
	}
}

- (void) importCharacters: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"characters"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Character		*character = [MVM_Character importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (character) [existing addObject: character];
	}
}

- (void) importStories: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"stories"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Story		*story = [MVM_Story importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (story) [existing addObject: story];
	}
}

- (void) importComics: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"comics"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Comic		*comic = [MVM_Comic importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (comic) [existing addObject: comic];
	}
}

- (void) importEvents: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"events"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Event		*event = [MVM_Event importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (event) [existing addObject: event];
	}
}

- (void) importCreators: (NSDictionary *) info toDepth: (NSNumber *) depth  {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"creators"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Creator		*creator = [MVM_Creator importServerObject: item toDepth: depth.integerValue - 1 intoContext: self.managedObjectContext];
		
		if (creator) [existing addObject: creator];
	}
}

- (void) fetchThumbnailWithCompletion: (mv_imageDownloadCompletionBlock) completion {
	if (self[@"thumbnail"] == nil) {
		completion(nil, nil);
	} else [[MV_DownloadManager defaultManager] downloadImageWithPath: self[@"thumbnail"][@"path"] ofSize: MV_Image_size_standard_small extension: self[@"thumbnail"][@"extension"] andCompletion:^(UIImage *image, NSError *error) {
		completion(image, error);
	}];
}

- (void) fetchFullScreenImageWithCompletion: (mv_imageDownloadCompletionBlock) completion {
	if (self[@"thumbnail"] == nil) {
		completion(nil, nil);
	} else [[MV_DownloadManager defaultManager] downloadImageWithPath: self[@"thumbnail"][@"path"] ofSize: MV_Image_size_portrait_uncanny extension: self[@"thumbnail"][@"extension"] andCompletion:^(UIImage *image, NSError *error) {
		completion(image, error);
	}];
}




//================================================================================================================
#pragma mark display

+ (NSString *) defaultSortKey { return @"name"; }
+ (NSString *) userVisibleName { return @""; }
+ (NSString *) userVisiblePluralName  { return @""; }
- (NSString *) mainTableText { return @""; };

//================================================================================================================
#pragma mark Utility
- (NSString *) convertServerFieldToObjectField: (NSString *) field {
	if ([field isEqual: @"id"]) return @"apiId";
	if ([field isEqual: @"description"]) return @"apiDescription";
	return field;
}

- (id) objectForKeyedSubscript: (id) key { return [self valueForKey: key]; }
- (void) setObject: (id) obj forKeyedSubscript: (id) key { [self setValue: obj forKey: key]; }
@end


@implementation NSDictionary (MVM_)

- (NSNumber *) mv_apiId {
	NSNumber				*apiId = self[@"id"];
	
	if (apiId == nil) {
		NSString			*idViaURI = [self[@"resourceURI"] lastPathComponent];
		
		if (idViaURI) apiId = @([idViaURI integerValue]);
	}
	return apiId;
}

@end