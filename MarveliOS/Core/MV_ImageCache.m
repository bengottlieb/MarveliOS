//
//  MV_ImageCache.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/28/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_ImageCache.h"
#import "MV_DownloadManager.h"

@interface MV_ImageCache ()
@property (nonatomic, strong) NSCache *cache;
@property (nonatomic, strong) NSURL *cacheDirectoryURL;
@end

@implementation MV_ImageCache
SINGLETON_IMPLEMENTATION_FOR_CLASS_AND_METHOD(MV_ImageCache, defaultCache);

- (id) init {
	if (self = [super init]) {
		self.cache = [NSCache new];
		self.cacheDirectoryURL = [[NSURL fileURLWithPath: NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject] URLByAppendingPathComponent: @"mv_images_cache"];
		
		NSError				*error;
		[[NSFileManager defaultManager] createDirectoryAtURL: self.cacheDirectoryURL withIntermediateDirectories: YES attributes: nil error: &error];
		if (error) NSLog(@"Error while creating images cache directory: %@", error);
	}
	return self;
}

- (NSURLSessionDataTask *) fetchImageAtURL: (NSURL *) url withCompletion: (mv_imageDownloadCompletionBlock) completion {
	NSString			*key = [self keyFromURL: url];
	UIImage				*image = [self.cache objectForKey: key];
	
	if (image) {
		completion(image, nil);
		return nil;
	}
	
	NSURL				*fileURL = [self.cacheDirectoryURL URLByAppendingPathComponent: [NSString stringWithFormat: @"%@.%@", key, url.pathExtension]];
	
	image = [[UIImage alloc] initWithContentsOfFile: fileURL.path];
	
	if (image) {
		completion(image, nil);
		[self.cache setObject: image forKey: key];
		return nil;
	}
	
	return [[MV_DownloadManager defaultManager] downloadRequest: [NSURLRequest requestWithURL: url] withCompletion: ^(NSData *data, NSError *error) {
		UIImage			*freshImage = data ? [UIImage imageWithData: data] : nil;
		
		if (freshImage) {
			completion(freshImage, nil);
			[self.cache setObject: freshImage forKey: key];
			
			[data writeToURL: fileURL atomically: YES];
		} else {
			completion(nil, error);
		}
	}];

}

- (NSString *) keyFromURL: (NSURL *) url {
	return [url.path stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
}

@end
