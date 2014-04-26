

#define			BASE_API_ENDPOINT				[NSURL URLWithString: @"http://gateway.marvel.com/"]



#define SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(classname, methodName)			+ (classname *) methodName;
#define SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(classname, methodName)	static classname *s_##methodName = nil; + (classname *) methodName { static dispatch_once_t  once; dispatch_once(&once, ^ { s_##methodName = [[self alloc] init]; }); return s_##methodName; }






//=============================================================================================================================
#pragma mark Categories
@interface UIAlertView (MV_)
+ (void) showAlertWithTitle: (NSString *) title message: (NSString *) message;
@end



