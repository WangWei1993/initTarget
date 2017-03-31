//
//  WWTabBarController.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

// 将TabBar的标题、图片、选中图片
FOUNDATION_EXTERN NSString *const WWTabBarTitle;
FOUNDATION_EXTERN NSString *const WWTabBarImage;
FOUNDATION_EXTERN NSString *const WWTabBarSelectImage;


@interface PSSTabBarController : UITabBarController

/** tabBarController上面的子控制器数组 */
@property (nonatomic, readwrite, strong) NSArray<UIViewController *> *tabBarControllers;

/** tabBarItem的属性数组 */
@property (nonatomic, readwrite, strong) NSArray<NSDictionary *> *tabBarItemsAttributes;

// 初始化TabBarController
- (instancetype)initWithViewControllerWithControllers:(NSArray<UIViewController *> *)tabBarControllers tabBarItemsAttributes:(NSArray<NSDictionary *> *)tabBarItemsAttributes;

@end
