#import "MVM_Comic.h"


@interface MVM_Comic ()

// Private interface goes here.

@end


@implementation MVM_Comic

- (MV_Object_type) objectType { return MV_Object_type_comic; }
+ (NSString *) defaultSortKey { return @"earliestDate"; }
- (NSString *) titleInitial { return [self.title substringToIndex: 1]; }
+ (NSString *) userVisibleName { return @"comic"; }
+ (NSString *) userVisiblePluralName  { return @"comics"; }
- (NSString *) mainTableText { return self.title; };
- (NSString *) detailedDescription {
	return [NSString stringWithFormat: @"Characters: %@\n"
			@"Creators: %@\n"
			@"First: %@\n"
			@"Events: %@\n"
			, [[self.characters.allObjects valueForKey: @"name"] componentsJoinedByString: @", " ]
			, [[self.creators.allObjects valueForKey: @"fullName"] componentsJoinedByString: @", " ]
			, self.earliestDate ?: @"--"
			, [[self.events.allObjects valueForKey: @"title"] componentsJoinedByString: @", " ]
			
			];
}
@end
