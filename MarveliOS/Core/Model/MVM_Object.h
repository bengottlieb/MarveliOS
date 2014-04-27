#import <CoreData/CoreData.h>

@interface MVM_Object : NSManagedObject {}


+ (instancetype) importServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth intoContext: (NSManagedObjectContext *) moc;
+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc;
- (void) updateFromServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth;
- (void) fetchUpdateFromServerToDepth: (NSUInteger) depth;

+ (NSString *) entityName;

@end



@interface NSDictionary (MVM_)
@property (nonatomic, readonly) NSNumber *mv_apiId;
@end