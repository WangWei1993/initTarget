//
//  WWBaseNavController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSBaseNavController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIBarButtonItem+BarButtonItemCustom.h"

@interface PSSBaseNavController ()

@end

@implementation PSSBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


#pragma mark -
#pragma mark - Public Method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 设置导航栏的属性
    [self setUpNavigationBarAppearance];
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = CGRectGetWidth([UIScreen mainScreen].bounds)/3;
        [self setUpCustomNavigationBarWithViewController:viewController];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - 设置全局的导航栏属性
- (void)setUpNavigationBarAppearance
{
    // 获取全局的navigationBar
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    // 设置字体属性
    NSDictionary *textAttributes = @{//NSFontAttributeName:WWSetFont(@"Noteworthy-Bold", 18),
                                     NSForegroundColorAttributeName: [UIColor whiteColor]
                                     };
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    navigationBarAppearance.tintColor = [UIColor whiteColor];
    navigationBarAppearance.barTintColor = ColorBlue;
}
- (void)setUpCustomNavigationBarWithViewController:(UIViewController *)viewController
{
    UIBarButtonItem * item = [UIBarButtonItem itemWithTarget: self action:@selector(btnLeftBtn) image:@"icon_nav_back_white_19x18_"  selectImage:@"icon_nav_back_white_19x18_"];
    viewController.navigationItem.leftBarButtonItem = item;
}
- (void)btnLeftBtn
{
    [self popViewControllerAnimated:YES];
}
#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
