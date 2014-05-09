#import "MVM_Character.h"
#import "MVM_Comic.h"

@interface MVM_Character ()

// Private interface goes here.

@end


@implementation MVM_Character

- (MV_Object_type) objectType { return MV_Object_type_character; }
- (NSString *) nameInitial { return [self.name substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"character"; }
+ (NSString *) userVisiblePluralName  { return @"characters"; }
- (NSString *) mainTableText { return self.name; };

- (NSString *) detailedDescription {
	NSArray				*comics = [self.comics sortedArrayUsingDescriptors: @[ [NSSortDescriptor sortDescriptorWithKey: @"earliestDate" ascending: YES]] ];
	static NSDate		*oldDate = nil;
	
	if (oldDate == nil) oldDate = [NSDate dateWithTimeIntervalSinceReferenceDate: -2240589600];	//1930-01-01 00:00:00 +0000
	
	MVM_Comic			*first = nil;
	
	for (MVM_Comic *comic in comics) {
		if (comic.earliestDate && [comic.earliestDate laterDate: oldDate] != oldDate) {
			first = comic;
			break;
		}
	}
	
	return [NSString stringWithFormat: @"Name: %@\n"
			@"First Appearance: %@ %@\n"
			@"Description: %@\n"
			@"Comics: %d\n"
			@"Events: %d\n"
			@"Series: %d\n"
			@"Stories: %d\n"
			, self.name, first ? first.earliestDate : @"", first ? first.title : @"", self.apiDescription, (UInt16) self.comics.count, (UInt16) self.events.count, (UInt16) self.series.count, (UInt16) self.stories.count];
}

@end
