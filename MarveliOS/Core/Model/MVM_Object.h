#import <CoreData/CoreData.h>

@interface MVM_Object : NSManagedObject {}


+ (instancetype) importServerObject: (NSDictionary *) serverObject intoContext: (NSManagedObjectContext *) moc;
+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc;
- (void) updateFromServerObject: (NSDictionary *) serverObject;

+ (NSString *) entityName;

@end



@interface NSDictionary (MVM_)
@property (nonatomic, readonly) NSNumber *mv_apiId;
@end