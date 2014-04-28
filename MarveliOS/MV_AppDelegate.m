//
//  MV_AppDelegate.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_AppDelegate.h"
#import "MV_ServerQuery+FrequentQueries.h"
#import "MV_DownloadManager.h"
#import "MV_ObjectsTableViewController.h"

@interface MV_AppDelegate ()
@property (nonatomic, strong) MV_ObjectsTableViewController *objectsTableController;
@end

@implementation MV_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#warning Be sure to set your Public and Private API keys. Go to https://developer.marvel.com/pleasesignin to get a key
	[MV_DownloadManager defaultManager].publicAPIKey = @"PUBLIC_API_KEY";
	[MV_DownloadManager defaultManager].privateAPIKey = @"PRIVATE_API_KEY";

    
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.tintColor = [UIColor colorWithRed: 0.99 green: 0.19 blue: 0.28 alpha: 1.0];
	
	self.objectsTableController = [MV_ObjectsTableViewController controllerForObjectType: MV_Object_type_character];
	
	UISegmentedControl		*segs = [[UISegmentedControl alloc] initWithFrame: CGRectMake(0, 0, 200, 33)];
	
	[segs insertSegmentWithTitle: @"Characters" atIndex: 0 animated: NO];
	[segs insertSegmentWithTitle: @"Creators" atIndex: 1 animated: NO];
	[segs insertSegmentWithTitle: @"Series" atIndex: 2 animated: NO];
	[segs insertSegmentWithTitle: @"Events" atIndex: 3 animated: NO];
	[segs addTarget: self action: @selector(objectTableContentsChanged:) forControlEvents: UIControlEventValueChanged];
	segs.selectedSegmentIndex = 0;
	
	self.objectsTableController.navigationItem.titleView = segs;
	
	
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: self.objectsTableController];
	
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

	//MV_Object_type		types[] = { MV_Object_type_character, MV_Object_type_creator, MV_Object_type_event, MV_Object_type_series };
	
//	MV_ServerQuery			*query = [MV_ServerQuery queryForAllObjectsOfType: MV_Object_type_character];
//	[query fetchWithCompletion:^(NSError *error) {}];

	return YES;
}

- (void) objectTableContentsChanged: (UISegmentedControl *) control {
	MV_Object_type			types[] = {MV_Object_type_character, MV_Object_type_creator, MV_Object_type_series, MV_Object_type_event };
	
	self.objectsTableController.objectType = types[control.selectedSegmentIndex];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
