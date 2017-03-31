//
//  WWTabBarController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSTabBarController.h"
#import "UIImage+image.h"



NSString *const WWTabBarTitle = @"WWTabBarTitle";
NSString *const WWTabBarImage = @"WWTabBarImage";
NSString *const WWTabBarSelectImage = @"WWTabBarSelectImage";

@interface PSSTabBarController ()

@end

@implementation PSSTabBarController

/*
 问题:
 1.选中按钮的图片被渲染 -> iOS7之后默认tabBar上按钮图片都会被渲染 1.修改图片 2.通过代码 √
 2.选中按钮的标题颜色:黑色 标题字体大 -> 对应子控制器的tabBarItem
 3.发布按钮显示不出来
 */

// 只会调用一次
+ (void)load
{
    // 获这个类下UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 选中状态下
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = ColorWhite;
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateSelected];// 设置选中状态下的字体颜色
    
    // 正常状态下
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = ColorGrayColor;
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateNormal];
    
    // UITabBar
    // [UITabBar appearance].backgroundColor = ColorBlue;c
    // [UITabBar appearance].backgroundImage = [UIImage imageOriginalWithName:@"长方形"];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 自定义tabBar
    // [self setupTabBar];
    
    // 1 添加子控制器(5个子控制器) -> 自定义控制器 -> 划分项目文件结构
    //[self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
}

#pragma mark -
#pragma mark - Private Methods

/**
 *  添加子控制器(5个子控制器)
 */
- (void)setupAllChildViewController {
    
    
    
}

/**
 *  设置tabBar上按钮内容
 */
- (void)setupAllTitleButton {
    
}




/**
 *  利用 KVC 把系统的 tabBar 类型改为自定义类型。
 */
- (void)setupTabBar {
    // [self setValue:[[WWTabBar alloc] init] forKey:@"tabbar"];
}

/**
 *  设置所有子控制器
 */
- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    
    // tabBarViewControler子控制器的数量
    if (viewControllers.count) {
        
        for (UIViewController *vc in viewControllers) {
            [self addChildViewController:vc];
        }
    }
    
}

/**
 *  tabBarItem属性设置
 */
- (void)setTabBarItemsAttributes:(NSArray<NSDictionary *> *)tabBarItemsAttributes {
    
    for (int i = 0; i<tabBarItemsAttributes.count; i++) {
        
        NSDictionary *attributesDic = tabBarItemsAttributes[i];
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem.title = attributesDic[WWTabBarTitle];
        vc.tabBarItem.image = [UIImage imageNamed:attributesDic[WWTabBarImage]];
        vc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:attributesDic[WWTabBarSelectImage]];
    }
    
}



#pragma mark -
#pragma mark - public Methods

- (instancetype)initWithViewControllerWithControllers:(NSArray<UIViewController *> *)tabBarControllers tabBarItemsAttributes:(NSArray<NSDictionary *> *)tabBarItemsAttributes {
    if (self = [super init]) {
        
        // 给tabBarVC添加子控制器
        self.viewControllers = tabBarControllers;
        
        // 给每个tabBarItem设置图片和字体
        self.tabBarItemsAttributes = tabBarItemsAttributes;
        
    }
    
    return self;
}

@end
