// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Creator.m instead.

#import "_MVM_Creator.h"

const struct MVM_CreatorAttributes MVM_CreatorAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.firstName = @"firstName",
	.fullName = @"fullName",
	.lastName = @"lastName",
	.middleName = @"middleName",
	.modified = @"modified",
	.resourceURI = @"resourceURI",
};

const struct MVM_CreatorRelationships MVM_CreatorRelationships = {
	.characters = @"characters",
	.comics = @"comics",
	.events = @"events",
	.series = @"series",
	.stories = @"stories",
	.urls = @"urls",
};

const struct MVM_CreatorFetchedProperties MVM_CreatorFetchedProperties = {
};

@implementation MVM_CreatorID
@end

@implementation _MVM_Creator

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Creator" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Creator";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Creator" inManagedObjectContext:moc_];
}

- (MVM_CreatorID*)objectID {
	return (MVM_CreatorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apiIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apiId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic apiDescription;






@dynamic apiId;



- (int64_t)apiIdValue {
	NSNumber *result = [self apiId];
	return [result longLongValue];
}

- (void)setApiIdValue:(int64_t)value_ {
	[self setApiId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveApiIdValue {
	NSNumber *result = [self primitiveApiId];
	return [result longLongValue];
}

- (void)setPrimitiveApiIdValue:(int64_t)value_ {
	[self setPrimitiveApiId:[NSNumber numberWithLongLong:value_]];
}





@dynamic firstName;






@dynamic fullName;






@dynamic lastName;






@dynamic middleName;






@dynamic modified;






@dynamic resourceURI;






@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	

@dynamic comics;

	
- (NSMutableSet*)comicsSet {
	[self willAccessValueForKey:@"comics"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comics"];
  
	[self didAccessValueForKey:@"comics"];
	return result;
}
	

@dynamic events;

	
- (NSMutableSet*)eventsSet {
	[self willAccessValueForKey:@"events"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"events"];
  
	[self didAccessValueForKey:@"events"];
	return result;
}
	

@dynamic series;

	
- (NSMutableSet*)seriesSet {
	[self willAccessValueForKey:@"series"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"series"];
  
	[self didAccessValueForKey:@"series"];
	return result;
}
	

@dynamic stories;

	
- (NSMutableSet*)storiesSet {
	[self willAccessValueForKey:@"stories"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stories"];
  
	[self didAccessValueForKey:@"stories"];
	return result;
}
	

@dynamic urls;

	
- (NSMutableSet*)urlsSet {
	[self willAccessValueForKey:@"urls"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"urls"];
  
	[self didAccessValueForKey:@"urls"];
	return result;
}
	






@end
