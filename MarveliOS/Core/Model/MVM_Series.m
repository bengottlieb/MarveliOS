#import "MVM_Series.h"


@interface MVM_Series ()

// Private interface goes here.

@end


@implementation MVM_Series

- (MV_Object_type) objectType { return MV_Object_type_series; }
+ (NSString *) defaultSortKey { return @"title"; }
- (NSString *) titleInitial { return [self.title substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"series"; }
+ (NSString *) userVisiblePluralName  { return @"series"; }

@end
