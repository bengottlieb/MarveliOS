//
//  MV_DownloadManager.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MV_Query;

@interface MV_DownloadManager : NSObject



SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(MV_DownloadManager, defaultManager);

@property (nonatomic, copy) NSString *publicAPIKey, *privateAPIKey;
@property (nonatomic) NSUInteger apiVersion;
@property (nonatomic) unsigned long timeStamp;

- (void) downloadRequest: (NSURLRequest *) request withCompletion: (mv_downloadCompletionBlock) completion;

@end


