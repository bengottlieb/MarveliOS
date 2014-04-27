#import "MVM_Comic.h"


@interface MVM_Comic ()

// Private interface goes here.

@end


@implementation MVM_Comic

- (MV_Object_type) objectType { return MV_Object_type_comic; }
+ (NSString *) defaultSortKey { return @"title"; }
- (NSString *) titleInitial { return [self.title substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"comic"; }
+ (NSString *) userVisiblePluralName  { return @"comics"; }

@end
