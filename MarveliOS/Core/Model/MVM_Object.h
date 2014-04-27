#import <CoreData/CoreData.h>

@interface MVM_Object : NSManagedObject {}

+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc;
- (void) importServerObject: (NSDictionary *) serverObject;

+ (NSString *) entityName;

@end
