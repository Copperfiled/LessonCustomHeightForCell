//
//  AppDelegate.m
//  LessonCustomHeightForCell
//
//  Created by 陈清源 on 15/5/1.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
//    NSString *str = @"的啦无奈啦我能离开电脑卡了呢啊快乐的能力打完快乐努力卡问你呢打完你的离开那我考虑能快乐啊我的快乐那我离开的你啊为单位离开你的烂哇的努力卡为你打开努力中我打我努力看到你了卡无奈打完你的内裤";
//    
//    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName, nil];
//    
//    CGRect rect = [str boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    RootViewController *rootVC = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    
    [rootVC release];
    
    [self.window makeKeyAndVisible];
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
