//
//  UIImage+image.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

/**
 *  设置image不被渲染
 */
+ (UIImage *)imageOriginalWithName:(NSString *)imageName;

@end
