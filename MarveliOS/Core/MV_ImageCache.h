//
//  MV_ImageCache.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/28/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MV_ImageCache : NSObject
SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(MV_ImageCache, defaultCache);

- (NSURLSessionDataTask *) fetchImageAtURL: (NSURL *) url withCompletion: (mv_imageDownloadCompletionBlock) completion;

@end
