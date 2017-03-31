//
//  PSSServerConfig.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSServerConfig.h"

static NSString *PSSConfigEnv;

@implementation PSSServerConfig

+(void)setHTConfigEnv:(NSString *)value
{
    PSSConfigEnv = value;
}

+(NSString *)HTConfigEnv
{
    return PSSConfigEnv;
}
//获取服务器地址
+ (NSString *)getHTServerAddr{
    if ([PSSConfigEnv isEqualToString:@"00"]) {
        return URL_Test;
    }else{
        return URL;
    }
}


@end
