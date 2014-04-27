//
//  MV_DownloadManager.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MV_ServerQuery;

@interface MV_DownloadManager : NSObject



SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(MV_DownloadManager, defaultManager);

@property (nonatomic, copy) NSString *publicAPIKey, *privateAPIKey;	//these need to be set before any data can be pulled down. Go to https://developer.marvel.com/account to get yours
@property (nonatomic) NSUInteger apiVersion;						//defaults to 1. Probably leave this alone.

@property (nonatomic, copy) mv_simpleBlock apiLimitHitBlock;		//this is called when you hit your API limit for the day
@property (nonatomic) BOOL useNetworkActivityIndictor;				//should we turn the networkActivityIndictor on and off as we pull data down?


- (void) downloadJSON: (NSURL *) url withCompletion: (mv_jsonDownloadCompletionBlock) completion;
- (void) downloadImageWithPath: (NSString *) path ofSize: (MV_Image_size) size extension: (NSString *) ext andCompletion: (mv_imageDownloadCompletionBlock) completion;


//utilities
- (NSURL *) paramaterizeURL: (NSURL *) url withParameters: (NSDictionary *) parameters;
- (NSURL *) URLForFragment: (NSString *) fragment;
@end


