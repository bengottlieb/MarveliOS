#import "MVM_Event.h"


@interface MVM_Event ()

// Private interface goes here.

@end


@implementation MVM_Event

- (MV_Object_type) objectType { return MV_Object_type_event; }
+ (NSString *) defaultSortKey { return @"title"; }
- (NSString *) titleInitial { return [self.title substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"event"; }
+ (NSString *) userVisiblePluralName  { return @"events"; }

@end
