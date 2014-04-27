#import "MVM_Creator.h"


@interface MVM_Creator ()

// Private interface goes here.

@end


@implementation MVM_Creator

- (MV_Object_type) objectType { return MV_Object_type_creator; }
+ (NSString *) defaultSortKey { return @"lastName"; }
- (NSString *) lastNameInitial { return self.lastName.length ? [self.lastName substringToIndex: 1] : @""; }
+ (NSString *) userVisibleName { return @""; }
+ (NSString *) userVisiblePluralName  { return @""; }
- (NSString *) mainTableText { return self.fullName; };

@end
