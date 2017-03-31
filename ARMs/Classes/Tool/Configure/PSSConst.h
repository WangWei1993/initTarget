//
//  PSSConst.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef PSSConst_h
#define PSSConst_h


/********** 框架接口 ***********/

// login
FOUNDATION_EXTERN NSString *const  API_LOGIN;
// logout
FOUNDATION_EXTERN NSString *const  API_LOGOUT;
// version_check
FOUNDATION_EXTERN NSString *const  API_UPGRADE;
// client_save
FOUNDATION_EXTERN NSString *const  API_PUSHCLIENT_BIND;
// picture_add
FOUNDATION_EXTERN NSString *const  PIC_ADD;
// server_time
FOUNDATION_EXTERN NSString *const  API_SERVER_DATE;
// change_password
FOUNDATION_EXTERN NSString *const  API_PERSONINFO_FIXPASSWD;
// change_init
FOUNDATION_EXTERN NSString *const  API_PERSONINFO_INIT;
// change_info
FOUNDATION_EXTERN NSString *const  API_PERSONINFO_FIXINFO;


/********** 公告接口 ***********/
/*
 <string name="API_TOPMSG">/mvc/mobile/api/portal/annoucetop</string>
 <string name="API_MSGDTL">/mvc/mobile/api/portal/announcement</string>
 <string name="API_ANCTYPE">/mvc/mobile/api/portal/announcetype</string>
 <string name="API_ANC_BY_TYPE">/mvc/mobile/api/portal/announcelist</string>
 */

// API_TOPMSG
FOUNDATION_EXTERN NSString *const  API_TOPMSG;
// API_MSGDTL
FOUNDATION_EXTERN NSString *const  API_MSGDTL;
// API_ANCTYPE
FOUNDATION_EXTERN NSString *const  API_ANCTYPE;
// API_ANC_BY_TYPE
FOUNDATION_EXTERN NSString *const  API_ANC_BY_TYPE;


/********** 网络请求地址 ***********/

// 服务地址
FOUNDATION_EXTERN NSString *const  URL;
FOUNDATION_EXTERN NSString *const  URL_Test;






#endif /* PSSConst_h */
