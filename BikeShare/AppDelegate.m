//
//  AppDelegate.m
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-05.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    MapViewController *mapViewController = [[MapViewController alloc]init];
    mapViewController.title = @"Maps";
    
    UIViewController *moreInfoController = [[UIViewController alloc]init];
    moreInfoController.title = @"More Info";
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *feedViewController = [storyBoard instantiateViewControllerWithIdentifier:@"feedVC"];
    feedViewController.title = @"Show";
    
    mapViewController.view.backgroundColor = [UIColor whiteColor];
    moreInfoController.view.backgroundColor = [UIColor whiteColor];
    feedViewController.view.backgroundColor = [UIColor whiteColor];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    [tabBarController setViewControllers:@[feedViewController,mapViewController,moreInfoController]];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = tabBarController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
