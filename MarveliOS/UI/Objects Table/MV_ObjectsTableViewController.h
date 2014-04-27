//
//  MV_ObjectsTableViewController.h
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/27/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MV_ObjectsTableViewController : UITableViewController


+ (instancetype) controllerForObjectType: (MV_Object_type) type;

@property (nonatomic) MV_Object_type objectType;

@end
