//
//  UIBarButtonItem+BarButtonItem.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItemCustom.h"


@implementation UIBarButtonItem (BarButtonItemCustom)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectImage:(NSString *)selectImage
{
    
    UIButton * btn = [UIBarButtonItem buttonWithTarget:target action:action image:image selectImage:selectImage title:nil];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return item;
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title
{
    UIButton * btn = [UIBarButtonItem buttonWithTarget:target action:action image:image selectImage:selectImage title:title];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return item;
}

/**
 *  辅组方法,用来创建自定义按钮,显示图片、显示文字,设置内边距
 *
 *  @param target      <#target description#>
 *  @param action      action
 *  @param image       <#image description#>
 *  @param selectImage <#selectImage description#>
 *  @param title       <#title description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title
{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage * imageNormal = [UIImage imageNamed:image];
    UIImage * imageSelect = [UIImage imageNamed:selectImage];
    
    [btn setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:imageSelect forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    
    // 按钮的尺寸是根据图片的尺寸来的
    btn.size = imageNormal.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //让文字 显示在 按钮的下方
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    //设置文字内边距
    btn.titleEdgeInsets = UIEdgeInsetsMake(btn.height * 0.5 , 0, 0, 0);
    
    return btn;
}

@end
