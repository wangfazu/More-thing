//
//  AppDelegate.m
//  sinaWeibo
//
//  Created by app on 17/4/13.
//  Copyright © 2017年 Feizj. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabBar = [[ UITabBarController alloc]init];
    
    weiBoViewController *weibo = [[weiBoViewController alloc]init];
    weibo.view.backgroundColor = [UIColor blackColor];
    weibo.tabBarItem.title = @"微博";
    
    xiaoXiViewController *xiaoXi = [[xiaoXiViewController alloc]init];
    xiaoXi.view.backgroundColor = [UIColor blueColor];
    xiaoXi.tabBarItem.title = @"消息";
    
    addViewController *add = [[addViewController alloc]init];
    add.view.backgroundColor = [UIColor whiteColor];
    add.tabBarItem.title =@"+";
    
    findViewController *find = [[findViewController alloc]init];
    find.view.backgroundColor = [UIColor blueColor];
    find.tabBarItem.title = @"发现";
    
    meViewController *me = [[meViewController alloc]init];
    me.view.backgroundColor = [UIColor greenColor];
    me.tabBarItem.title = @"我";
    
    /**
     将五个界面装入UINavigationController
     */
    UINavigationController *navWeibo = [[UINavigationController alloc]initWithRootViewController:weibo];
    UINavigationController *navXiaoXi = [[UINavigationController alloc]initWithRootViewController:xiaoXi];
    UINavigationController *navAdd = [[UINavigationController alloc]initWithRootViewController:add];
    UINavigationController *navFind = [[UINavigationController alloc]initWithRootViewController:find];
    UINavigationController *navMe = [[UINavigationController alloc]initWithRootViewController:me];
   
    
    
    /**
     将这五个界面装入tabBar中
     */
    [tabBar addChildViewController:navWeibo];
    [tabBar addChildViewController:navXiaoXi];
    [tabBar addChildViewController:navAdd];
    [tabBar addChildViewController:navFind];
    [tabBar addChildViewController:navMe];
    
    /**
     *  从DELEGATE中获取使用View权限，然后将管理权限移交给，已经设置好的tabBar
     */
    [[[UIApplication sharedApplication]delegate]window].rootViewController =tabBar;



    
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
