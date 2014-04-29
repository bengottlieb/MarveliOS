//
//  MV_DownloadManager.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_DownloadManager.h"
#import "MV_ServerQuery.h"
#import "MV_ImageCache.h"
#import <CommonCrypto/CommonDigest.h>

@interface MV_DownloadManager () <NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic) unsigned long activityIndicatorCount;
@property (nonatomic, readwrite) unsigned long timeStamp, apiUseCount;
@property (nonatomic, strong) NSDate *currentDaysAPIUseFirstTime;
@end


@implementation MV_DownloadManager
SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(MV_DownloadManager, defaultManager);

- (id) init {
	if (self = [super init]) {		
		self.apiVersion = 1;
		self.useNetworkActivityIndictor = YES;
		self.timeStamp = [NSDate timeIntervalSinceReferenceDate];
		self.queue = [NSOperationQueue new];
		self.apiLimitHitBlock = ^{ [UIAlertView showAlertWithTitle: @"API Limit Reached" message: @"You've reached your API limit for the day. Come back tomrorow!"]; };
		
		[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(significantTimeChange) name: UIApplicationSignificantTimeChangeNotification object: nil];
		_apiUseCount = [[[NSUserDefaults standardUserDefaults] objectForKey: API_USE_KEY_DEFAULTS_KEY] unsignedLongValue];
	}
	return self;
}

- (void) downloadImageWithPath: (NSString *) path ofSize: (MV_Image_size) size extension: (NSString *) ext andCompletion: (mv_imageDownloadCompletionBlock) completion {
	NSArray			*imageSizes = @[ @"portrait_small", @"portrait_medium", @"portrait_xlarge", @"portrait_fantastic", @"portrait_uncanny", @"portrait_incredible",
									 @"standard_small", @"standard_medium", @"standard_large", @"standard_xlarge", @"standard_fantastic", @"standard_amazing",
									 @"landscape_small", @"landscape_medium", @"landscape_large", @"landscape_xlarge", @"landscape_amazing", @"landscape_incredible" ];
	
	path = [path stringByAppendingPathComponent: [NSString stringWithFormat: @"%@.%@", imageSizes[size], ext]];
	
	NSURL			*url = [NSURL URLWithString: path];
	
	[[MV_ImageCache defaultCache] fetchImageAtURL: url withCompletion: completion];
}

- (void) downloadJSON: (NSURL *) url withCompletion: (mv_jsonDownloadCompletionBlock) completion {
	[self downloadRequest: [NSURLRequest requestWithURL: url] withCompletion: ^(NSData *data, NSError *error) {
		if (error) {
			completion(nil, error);
		} else {
			NSError				*jsonError;
			NSDictionary		*results = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &jsonError];
			
			if (jsonError) {
				completion(nil, jsonError);
				return;
			}
			
			completion(results, nil);
		}
	}];
}

//=============================================================================================================================
#pragma mark Properties
- (NSURLSession *) session {
	if (_session == nil) {
		NSURLSessionConfiguration			*config = [NSURLSessionConfiguration defaultSessionConfiguration];
		
		self.session = [NSURLSession sessionWithConfiguration: config delegate: self delegateQueue: self.queue];
	}
	return _session;
}

- (void) setApiUseCount: (unsigned long) apiUseCount {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject: @(apiUseCount) forKey: API_USE_KEY_DEFAULTS_KEY];
	[defaults synchronize];
	
	_apiUseCount = apiUseCount;
	if (apiUseCount % 25 == 0) NSLog(@"Current API Use Count: %d", (UInt16) apiUseCount);
}


//================================================================================================================
#pragma mark Notifications
- (void) significantTimeChange {
	self.apiUseCount = 0;
}

//=============================================================================================================================
#pragma mark Utilities

- (void) downloadRequest: (NSURLRequest *) request withCompletion: (mv_downloadCompletionBlock) completion {
	if (request == nil) {
		completion(nil, [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_missingAPIKeys userInfo: nil]);
		return;
	}
	
	self.activityIndicatorCount++;
	
	if ([request.URL.query rangeOfString: @"apikey="].location != NSNotFound) self.apiUseCount++;
	
	NSURLSessionDataTask	*task = [self.session dataTaskWithRequest: request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
		NSUInteger			statusCode = [(NSHTTPURLResponse *) response statusCode];
		
		if (error == nil) switch (statusCode) {
			case 401:
			case 409: error = [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_missingAPIKeys userInfo: nil]; break;
			case 429:
				error = [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_rateLimitExceeded userInfo: nil];
				if (self.apiLimitHitBlock) self.apiLimitHitBlock();
				break;
			default: break;
		}
		
		if (error) {
			completion(nil, error);
		} else
			completion(data, error);
		self.activityIndicatorCount--;
	}];
	[task resume];
}

- (NSURL *) paramaterizeURL: (NSURL *) url withParameters: (NSDictionary *) parameters {
	if (self.privateAPIKey.length == 0 || self.publicAPIKey.length == 0) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[UIAlertView showAlertWithTitle: @"Missing API Keys" message: @"Please set the publicAPIKey and privateAPIKey property on [MV_DownloadManager defaultManager]."];
		});
		return nil;
	}

	NSMutableDictionary		*fullQuery = parameters ? parameters.mutableCopy : [NSMutableDictionary dictionary];
	NSURLComponents			*components = [NSURLComponents componentsWithURL: url resolvingAgainstBaseURL: NO];
	
	unsigned long			timeStamp = self.timeStamp++;
	NSString				*hashBase = [NSString stringWithFormat: @"%ld%@%@", timeStamp, self.privateAPIKey, self.publicAPIKey];
	NSString				*hash = [self md5ForString: hashBase];
	
	fullQuery[@"ts"] = @(timeStamp);
	fullQuery[@"hash"] = hash;
	fullQuery[@"apikey"] = self.publicAPIKey;
	
	NSMutableString			*queryString = [NSMutableString string];
	for (NSString *key in fullQuery) {
		[queryString appendFormat: @"%@=%@&", key, fullQuery[key]];
	}
	
	components.query = queryString;
	//components.path = [[NSString stringWithFormat: @"/v%d/public/", (UInt16) [MV_DownloadManager defaultManager].apiVersion] stringByAppendingPathComponent: self.fragment];
	
	return components.URL;
}

- (NSURL *) URLForFragment: (NSString *) fragment {
	NSString			*path = [[NSString stringWithFormat: @"/v%d/public/", (UInt16) self.apiVersion] stringByAppendingPathComponent: fragment];
	
	return [BASE_API_ENDPOINT URLByAppendingPathComponent: path];
}

- (NSString *) md5ForString: (NSString *) string {
	const char			*ptr = [string UTF8String];
	unsigned char		md5Buffer[CC_MD5_DIGEST_LENGTH];
	
	CC_MD5(ptr, (CC_LONG) strlen(ptr), md5Buffer);
	
	NSMutableString		*output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[output appendFormat:@"%02x", md5Buffer[i]];
	}
	return output;
}

- (void) setActivityIndicatorCount: (unsigned long) activityIndicatorCount {
	if (activityIndicatorCount == _activityIndicatorCount) return;
	
	if (self.useNetworkActivityIndictor) {
		BOOL				shouldShow = (_activityIndicatorCount == 0);
		BOOL				shouldHide = (activityIndicatorCount == 0);
		
		if (shouldShow || shouldHide) dispatch_async(dispatch_get_main_queue(), ^{
			if (shouldShow) [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
			if (shouldHide) [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		});
	}
	_activityIndicatorCount = activityIndicatorCount;
}

@end
