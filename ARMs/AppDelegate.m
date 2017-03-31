//
//  AppDelegate.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "AppDelegate.h"
#import "PSSTabBarControllerConfig.h"
#import "PSSLoginViewController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

/**
 *  tabBarControllerConfig
 */
@property (nonatomic, strong) PSSTabBarControllerConfig *tabBarControllerConfig;

@end

@implementation AppDelegate

static int i = 0;

#pragma mark -
#pragma mark - Life Cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSLog(@"屏幕的尺寸：%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    
    
    // 设置根控制器
    [self setRootController];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


#pragma mark -
#pragma mark - picbic Methods
// 设置根控制器
- (void)setRootController
{
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    if (!i) {
        //
        PSSLoginViewController *loginViewController = [[PSSLoginViewController alloc] init];
        self.window.rootViewController = loginViewController;
        
    } else {
        // TabBarController
        PSSTabBarControllerConfig *tabBarControllerConfig = [[PSSTabBarControllerConfig alloc] init];
        [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    }
    
    // 登录控制器
    
    
    [self.window makeKeyAndVisible];
    
    i++;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}





- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
