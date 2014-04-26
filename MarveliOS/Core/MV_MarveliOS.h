


/**
 *	An Objective-C wrapper for the Marvel API
 *
 *	http://developer.marvel.com/docs#!/public/
 *
 *
 */


typedef void (^mv_downloadCompletionBlock)(NSDictionary *results, NSError *error);
typedef void (^mv_queryCompletedBlock)(NSError *error);
typedef void (^mv_progressBlock)(CGFloat percentComplete);






//=============================================================================================================================
#pragma mark Errors

extern NSString			* const MV_ErrorDomain;


typedef NS_ENUM(NSUInteger, MV_Error) {
	MV_Error_missingAPIKeys					= 1,
	MV_Error_rateLimitExceeded				= 2,
};



