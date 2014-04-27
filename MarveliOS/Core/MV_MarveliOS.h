


/**
 *	An Objective-C wrapper for the Marvel API
 *
 *	http://developer.marvel.com/docs#!/public/
 *
 *
 */


typedef void (^mv_downloadCompletionBlock)(NSData *data, NSError *error);
typedef void (^mv_jsonDownloadCompletionBlock)(NSDictionary *results, NSError *error);
typedef void (^mv_imageDownloadCompletionBlock)(UIImage *image, NSError *error);
typedef void (^mv_queryCompletedBlock)(NSError *error);
typedef void (^mv_progressBlock)(CGFloat percentComplete);
typedef void (^mv_contextBlock)(NSManagedObjectContext *moc);
typedef void (^mv_importCompletionBlock)(NSArray *importedObjectIDs);
typedef void (^mv_simpleBlock)();

typedef NS_ENUM(NSUInteger, MV_Object_type) {
	MV_Object_type_none,
	MV_Object_type_character,
	MV_Object_type_comic,
	MV_Object_type_creator,
	MV_Object_type_event,
	MV_Object_type_series,
	MV_Object_type_story
};

typedef NS_ENUM(UInt8, MV_Image_size) {
	MV_Image_size_portrait_small,			//	50x75px
	MV_Image_size_portrait_medium,			//	100x150px
	MV_Image_size_portrait_xlarge,			//	150x225px
	MV_Image_size_portrait_fantastic,		//	168x252px
	MV_Image_size_portrait_uncanny,			//	300x450px
	MV_Image_size_portrait_incredible,		//	216x324px
	
	MV_Image_size_standard_small,			//	65x45px
	MV_Image_size_standard_medium,			//	100x100px
	MV_Image_size_standard_large,			//	140x140px
	MV_Image_size_standard_xlarge,			//	200x200px
	MV_Image_size_standard_fantastic,		//	250x250px
	MV_Image_size_standard_amazing,			//	180x180px
	
	MV_Image_size_landscape_small,			//	120x90px
	MV_Image_size_landscape_medium,			//	175x130px
	MV_Image_size_landscape_large,			//	190x140px
	MV_Image_size_landscape_xlarge,			//	270x200px
	MV_Image_size_landscape_amazing,		//	250x156px
	MV_Image_size_landscape_incredible,		//	464x261px
};


//=============================================================================================================================
#pragma mark Errors

extern NSString			* const MV_ErrorDomain;


typedef NS_ENUM(NSUInteger, MV_Error) {
	MV_Error_missingAPIKeys					= 1,
	MV_Error_rateLimitExceeded				= 2,
};



