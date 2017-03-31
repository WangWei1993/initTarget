//
//  HTConst.m
//  HeartTrip
//
//  Created by 熊彬 on 16/9/13.
//  Copyright © 2016年 BinBear. All rights reserved.
//

#import "PSSConst.h"

/********** 框架接口 ***********/

// login
NSString *const  API_LOGIN = @"/mvc/mobile/api/login";
// logout
NSString *const  API_LOGOUT = @"/mvc/mobile/api/logout";
// version_check
NSString *const  API_UPGRADE = @"/mvc/mobile/api/appversion/check";
// client_save
NSString *const  API_PUSHCLIENT_BIND = @"/mvc/mobile/api/client/save";
// picture_add
NSString *const  PIC_ADD = @"/mvc/mobile/api/picture/add";
// server_time
NSString *const  API_SERVER_DATE = @"/mvc/mobile/api/server/time";
// change_password
NSString *const  API_PERSONINFO_FIXPASSWD = @"/mvc/mobile/api/user/change/password";
// change_init
NSString *const  API_PERSONINFO_INIT = @"/mvc/mobile/api/user/change/init";
// change_info
NSString *const  API_PERSONINFO_FIXINFO = @"/mvc/mobile/api/user/change/info";


/********** 公告接口 ***********/
/*
 <string name="API_TOPMSG">/mvc/mobile/api/portal/annoucetop</string>
 <string name="API_MSGDTL">/mvc/mobile/api/portal/announcement</string>
 <string name="API_ANCTYPE">/mvc/mobile/api/portal/announcetype</string>
 <string name="API_ANC_BY_TYPE">/mvc/mobile/api/portal/announcelist</string>
 */

// login
FOUNDATION_EXTERN NSString *const  API_TOPMSG;
// logout
FOUNDATION_EXTERN NSString *const  API_MSGDTL;
// version_check
FOUNDATION_EXTERN NSString *const  API_ANCTYPE;
// client_save
FOUNDATION_EXTERN NSString *const  API_ANC_BY_TYPE;

/********** 网络请求地址 ***********/

// 服务地址
NSString *const  URL = @"";
NSString *const  URL_Test = @"https://psstest.sony.com.cn/";


// 首页
NSString *const  CityTravel_URL = @"";

// 发现
NSString *const  Find_URL = @"";

// 更多视频
NSString *const  ExploreMore_URL = @"";

