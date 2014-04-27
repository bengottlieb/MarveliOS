#import <CoreData/CoreData.h>

@interface MVM_Object : NSManagedObject {}


+ (NSString *) entityName;

+ (instancetype) importServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth intoContext: (NSManagedObjectContext *) moc;
+ (instancetype) findObjectMatching: (NSDictionary *) serverObject inContext: (NSManagedObjectContext *) moc;
- (void) updateFromServerObject: (NSDictionary *) serverObject toDepth: (NSUInteger) depth;
- (void) fetchUpdateFromServerToDepth: (NSUInteger) depth;

- (void) fetchThumbnailWithCompletion: (mv_imageDownloadCompletionBlock) completion;

@end



@interface NSDictionary (MVM_)
@property (nonatomic, readonly) NSNumber *mv_apiId;
@end