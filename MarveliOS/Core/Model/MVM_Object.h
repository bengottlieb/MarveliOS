#import <CoreData/CoreData.h>

@interface MVM_Object : NSManagedObject {}


+ (NSString *) entityName;
+ (NSString *) defaultSortKey;
+ (NSString *) userVisibleName;
+ (NSString *) userVisiblePluralName;


+ (instancetype) importServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth intoContext: (NSManagedObjectContext *) moc;
+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc;
- (void) updateFromServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth;
- (void) fetchUpdateFromServerToDepth: (NSUInteger) depth;

- (void) fetchThumbnailWithCompletion: (mv_imageDownloadCompletionBlock) completion;


- (id) objectForKeyedSubscript: (id) key;
- (void) setObject: (id) obj forKeyedSubscript: (id) key;

@end



@interface NSDictionary (MVM_)
@property (nonatomic, readonly) NSNumber *mv_apiId;
@end