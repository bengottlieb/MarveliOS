#import "MVM_Character.h"


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
	return [NSString stringWithFormat: @"Name: %@\n"
			@"Description: %@\n"
			@"Comics: %d\n"
			@"Events: %d\n"
			@"Series: %d\n"
			@"Stories: %d\n"
			, self.name, self.apiDescription, (UInt16) self.comics.count, (UInt16) self.events.count, (UInt16) self.series.count, (UInt16) self.stories.count];
}

@end
