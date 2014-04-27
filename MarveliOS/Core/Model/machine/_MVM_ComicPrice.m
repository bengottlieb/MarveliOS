// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicPrice.m instead.

#import "_MVM_ComicPrice.h"

const struct MVM_ComicPriceAttributes MVM_ComicPriceAttributes = {
	.price = @"price",
	.type = @"type",
};

const struct MVM_ComicPriceRelationships MVM_ComicPriceRelationships = {
	.comic = @"comic",
};

const struct MVM_ComicPriceFetchedProperties MVM_ComicPriceFetchedProperties = {
};

@implementation MVM_ComicPriceID
@end

@implementation _MVM_ComicPrice

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ComicPrice" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ComicPrice";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ComicPrice" inManagedObjectContext:moc_];
}

- (MVM_ComicPriceID*)objectID {
	return (MVM_ComicPriceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic price;



- (float)priceValue {
	NSNumber *result = [self price];
	return [result floatValue];
}

- (void)setPriceValue:(float)value_ {
	[self setPrice:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result floatValue];
}

- (void)setPrimitivePriceValue:(float)value_ {
	[self setPrimitivePrice:[NSNumber numberWithFloat:value_]];
}





@dynamic type;






@dynamic comic;

	






@end
