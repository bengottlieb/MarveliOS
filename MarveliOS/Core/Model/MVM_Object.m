#import "MVM_Object.h"
#import "NSManagedObjectContext+MV_.h"

#import "MVM_Image.h"

@interface MVM_Object ()

// Private interface goes here.

@end


@implementation MVM_Object

+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc {
	return [moc mv_anyObjectOfType: [self entityName] matchingPredicate: [NSPredicate predicateWithFormat: @"apiId == %@", serverObject[@"id"]]];
}
			
+ (NSString *) entityName { return @"";}

- (void) importServerObject: (NSDictionary *) serverObject {
	NSDictionary				*props = self.entity.propertiesByName;
	
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
