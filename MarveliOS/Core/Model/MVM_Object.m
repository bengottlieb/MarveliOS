#import "MVM_Object.h"
#import "NSManagedObjectContext+MV_.h"

#import "MVM_Image.h"

#import "MVM_Series.h"
#import "MVM_Story.h"
#import "MVM_Character.h"
#import "MVM_Comic.h"
#import "MVM_Event.h"
#import "MVM_Creator.h"

@interface MVM_Object ()

// Private interface goes here.

@end


@implementation MVM_Object

+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc {
	NSNumber				*apiId = serverObject.mv_apiId;

	if (apiId == nil) return nil;
	return [moc mv_anyObjectOfType: [self entityName] matchingPredicate: [NSPredicate predicateWithFormat: @"apiId == %@", apiId]];
}

+ (instancetype) importServerObject: (NSDictionary *) serverObject intoContext: (NSManagedObjectContext *) moc {
	MVM_Object			*object = [[self class] findObjectMatching: serverObject inContext: moc];
	
	if (object == nil) object = [moc mv_insertNewEntityWithName: [[self class] entityName]];
	[object updateFromServerObject: serverObject];
	
	return object;
}

+ (NSString *) entityName { return @"";}

- (void) updateFromServerObject: (NSDictionary *) serverObject {
	NSDictionary				*props = self.entity.propertiesByName;
	
	self[@"partialImport"] = @(serverObject[@"id"] == nil);
	
	self[@"apiId"] = serverObject.mv_apiId;
	
	for (NSString *key in serverObject) {
		NSString					*field = [self convertServerFieldToObjectField: key];
		NSAttributeDescription		*desc = props[field];
		
		if (desc == nil) continue;
		
		if ([desc isKindOfClass: [NSAttributeDescription class]]) {
			switch (desc.attributeType) {
				case NSDateAttributeType:
					break;
				default:
					self[field] = serverObject[key];
					break;
			}
		} else {
			NSString			*importer = [NSString stringWithFormat: @"import%@:", [field capitalizedString]];
			SEL					sel = NSSelectorFromString(importer);
			
			_Pragma("clang diagnostic push") \
			_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
			if ([self respondsToSelector: sel]) [self performSelector: sel withObject: serverObject[key]];
			_Pragma("clang diagnostic pop") \
		}
	}
}



//================================================================================================================
#pragma mark Importers
- (void) importThumbnail: (NSDictionary *) info {
	MVM_Image			*thumbnail = self[@"thumbnail"];
	
	if ([thumbnail.path isEqual: info[@"path"]]) return;		//already in there
	
	if (thumbnail) [self.managedObjectContext deleteObject: thumbnail];
	
	thumbnail = [self.managedObjectContext mv_insertNewEntityWithName: [MVM_Image entityName]];
	thumbnail.path = info[@"path"];
	thumbnail.extension = info[@"extension"];
	self[@"thumbnail"] = thumbnail;
}

- (void) importImages: (NSDictionary *) imagesInfo {
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

- (void) importSeries: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"series"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Series		*series = [MVM_Series importServerObject: item intoContext: self.managedObjectContext];
		
		if (series) [existing addObject: series];
	}
}

- (void) importCharacters: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"characters"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Character		*character = [MVM_Character importServerObject: item intoContext: self.managedObjectContext];
		
		if (character) [existing addObject: character];
	}
}

- (void) importStories: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"stories"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Story		*story = [MVM_Story importServerObject: item intoContext: self.managedObjectContext];
		
		if (story) [existing addObject: story];
	}
}

- (void) importComics: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"comics"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Comic		*comic = [MVM_Comic importServerObject: item intoContext: self.managedObjectContext];
		
		if (comic) [existing addObject: comic];
	}
}

- (void) importEvents: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"events"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Event		*event = [MVM_Event importServerObject: item intoContext: self.managedObjectContext];
		
		if (event) [existing addObject: event];
	}
}

- (void) importCreators: (NSDictionary *) info {
	NSMutableSet			*existing = [self mutableSetValueForKey: @"creators"];
	
	for (NSDictionary *item in info[@"items"]) {
		MVM_Creator		*creator = [MVM_Creator importServerObject: item intoContext: self.managedObjectContext];
		
		if (creator) [existing addObject: creator];
	}
}


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