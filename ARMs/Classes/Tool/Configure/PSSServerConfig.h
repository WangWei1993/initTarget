//
//  PSSServerConfig.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSSServerConfig : NSObject

// env: 环境参数 00: 测试环境 01: 生产环境
+ (void)setHTConfigEnv:(NSString *)value;

// 返回环境参数 00: 测试环境 01: 生产环境
+ (NSString *)HTConfigEnv;

// 获取服务器地址
+ (NSString *)getHTServerAddr;

@end
