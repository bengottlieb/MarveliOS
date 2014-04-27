#import "MVM_Story.h"


@interface MVM_Story ()

// Private interface goes here.

@end


@implementation MVM_Story

- (MV_Object_type) objectType { return MV_Object_type_story; }
+ (NSString *) defaultSortKey { return @"title"; }
- (NSString *) titleInitial { return [self.title substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"story"; }
+ (NSString *) userVisiblePluralName  { return @"stories"; }

@end
