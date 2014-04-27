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
@end
