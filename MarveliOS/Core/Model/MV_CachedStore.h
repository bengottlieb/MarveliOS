//
//  MV_CachedStore.h
//  TimeLine
//
//  Created by Ben Gottlieb on 4/29/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MV_CachedStore : MV_Store
SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(MV_CachedStore, defaultCache);

+ (void) setCacheLocation: (NSURL *) url;

@end
