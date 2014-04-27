//
//  MV_Store.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// mogenerator -m MarveliOS.xcdatamodeld/MarveliOS.xcdatamodel/ -M machine --base-class MVM_Object --template-var arc=true


@interface MV_Store : NSObject
SINGLETON_INTERFACE_FOR_CLASS_AND_METHOD(MV_Store, store);

@property (nonatomic, readonly) NSManagedObjectContext *moc;

@end
