//
//  MV_DownloadManager.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_DownloadManager.h"
#import "MV_Query.h"

@interface MV_DownloadManager () <NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOperationQueue *queue;
@end


@implementation MV_DownloadManager
SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(MV_DownloadManager, defaultManager);

- (id) init {
	if (self = [super init]) {		
		self.apiVersion = 1;
		self.timeStamp = [NSDate timeIntervalSinceReferenceDate];
		self.queue = [NSOperationQueue new];
	}
	return self;
}

- (void) downloadRequest: (NSURLRequest *) request withCompletion: (mv_downloadCompletionBlock) completion {
	if (request == nil) {
		completion(nil, [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_missingAPIKeys userInfo: nil]);
		return;
	}
	NSURLSessionDataTask	*task = [self.session dataTaskWithRequest: request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
		NSUInteger			statusCode = [(NSHTTPURLResponse *) response statusCode];

		if (error == nil) switch (statusCode) {
			case 401:
			case 409: error = [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_missingAPIKeys userInfo: nil]; break;
			case 429: error = [NSError errorWithDomain: MV_ErrorDomain code: MV_Error_rateLimitExceeded userInfo: nil]; break;
			default: break;
		}
		
		if (error) {
			completion(nil, error);
			return;
		}
		
		NSError				*jsonError;
		NSDictionary		*results = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &jsonError];
		
		if (jsonError) {
			completion(nil, jsonError);
			return;
		}
		
		completion(results, nil);
	}];
	
	[task resume];

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



//=============================================================================================================================
#pragma mark Utilities

@end
