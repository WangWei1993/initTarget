//
//  WWTabBarControllerConfig.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSTabBarControllerConfig.h"
#import "PSSMeViewController.h"
#import "PSSBaseNavController.h"
#import "PSSAllFunctionController.h"
#import "PSSMessageController.h"
#import "PSSHomeController.h"

@interface PSSTabBarControllerConfig ()

/** WWTabBarController */
@property (nonatomic, strong) PSSTabBarController *tabBarController;

/** tabBarControllers */
@property (nonatomic, strong) NSArray *tabBarControllers;

/** tabBarItemsAttributes */
@property (nonatomic, strong) NSArray *tabBarItemsAttributes;

@end

@implementation PSSTabBarControllerConfig

/**
 *  获取tabBarViewController
 */
- (PSSTabBarController *)tabBarController {
    return PSS_LAZY(_tabBarController, ({
    
        // 创建tabBarVC
        PSSTabBarController *tabBarController = [[PSSTabBarController alloc] initWithViewControllerWithControllers:self.tabBarControllers
                            tabBarItemsAttributes:self.tabBarItemsAttributes];
        
        tabBarController;
        
    }));
}


/**
 *  tabBarItem属性设置
 */
- (NSArray *)tabBarItemsAttributes {
    
    

    
    NSDictionary *dic1 = @{
                                  WWTabBarTitle       : @"工作台",
                                  WWTabBarImage       : @"tabBar_essence_icon",
                                  WWTabBarSelectImage : @"tabBar_essence_click_icon"
                                  };
    
    NSDictionary *dic2 = @{
                                  WWTabBarTitle       : @"消息",
                                  WWTabBarImage       : @"tabBar_essence_icon",
                                  WWTabBarSelectImage : @"tabBar_essence_click_icon"
                                  };
    
    NSDictionary *dic3 = @{
                                  WWTabBarTitle       : @"全部功能",
                                  WWTabBarImage       : @"tabBar_essence_icon",
                                  WWTabBarSelectImage : @"tabBar_essence_click_icon"
                                  };
     
    
    NSDictionary *dic4 = @{
                                  WWTabBarTitle       : @"我",
                                  WWTabBarImage       : @"tabBar_essence_icon",
                                  WWTabBarSelectImage : @"tabBar_essence_click_icon"
                                  };
    
    /*
    NSDictionary *dic5 = @{
                                  WWTabBarTitle       : @"设置",
                                  WWTabBarImage       : @"tabBar_me_icon",
                                  WWTabBarSelectImage : @"tabBar_me_click_icon"
                                  };
     */
    
    NSArray *tabBarItemsAttributes = @[
                                       dic1,
                                       dic2,
                                       dic3,
                                       dic4,
                                       // dic5
                                       ];
    return tabBarItemsAttributes;
    
}

/**
 *  子控制器设置
 */
- (NSArray *)tabBarControllers {
    /** 控制器1 */
    PSSHomeController *vc = [[PSSHomeController alloc] init];
    vc.title = @"ARMs";
    PSSBaseNavController *nav = [[PSSBaseNavController alloc] initWithRootViewController:vc];
    //vc.view.backgroundColor = ColorRandom;
    
    /** 控制器2 */
    PSSMessageController *vc1 = [[PSSMessageController alloc] init];
    PSSBaseNavController *nav1 = [[PSSBaseNavController alloc] initWithRootViewController:vc1];
    //vc1.view.backgroundColor = ColorRandom;
    
    /** 控制器3 */
    PSSAllFunctionController *vc2 = [[PSSAllFunctionController alloc] init];
    PSSBaseNavController *nav2 = [[PSSBaseNavController alloc] initWithRootViewController:vc2];
    //vc2.view.backgroundColor = ColorRandom;
     
    
    /** 控制器4 */
    PSSMeViewController *vc3 = [[PSSMeViewController alloc] init];
    PSSBaseNavController *nav3 = [[PSSBaseNavController alloc] initWithRootViewController:vc3];
    //vc3.view.backgroundColor = ColorRandom;
    
    /** 控制器5
    UIViewController *vc4 = [[UIViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    vc4.view.backgroundColor = ColorRandom;
     */
    
    NSArray *tabBarControllers = @[
                                       nav,
                                       nav1,
                                       nav2,
                                       nav3,
                                       // nav4
                                       ];
    
    return tabBarControllers;
    
}


@end
