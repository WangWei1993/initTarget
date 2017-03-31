//
//  PSSConfig.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/23.
//  Copyright © 2017年 王伟. All rights reserved.
//

#ifndef PSSConfig_h
#define PSSConfig_h




/********** weakSelf定义 ***********/

#define SNWeakSelf __weak typeof(self) weakSelf = self;
#define SNWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

/********** 提示框 ***********/

#define PSSAlert(__VA_ARGS__) UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:##__VA_ARGS__ preferredStyle:UIAlertControllerStyleAlert];\
[self presentViewController:alerVC animated:YES completion:nil];\
[alerVC addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDestructive handler:nil]];\
[alerVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];


/********** 懒加载 ***********/

#define PSS_LAZY(object, assignment) (object = object ?: assignment)



/********** 常用单利实例化 ***********/

//NSUserDefaults
#define PSSUserDefaults [NSUserDefaults standardUserDefaults]
//AppDelegate
#define PSSAPPDelegate (AppDelegate*)[UIApplication sharedApplication].delegate
//NotificationCenter
#define PSSNSNotificationCenter [NSNotificationCenter defaultCenter]
//keyWindow
#define PSSkeyWindow [UIApplication sharedApplication].keyWindow
//lastWindow
#define PSSLastWindow [[UIApplication sharedApplication].windows lastObject]



/********** 常用GCD ***********/
#define GCDWithGlobal(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDWithMain(block) dispatch_async(dispatch_get_main_queue(),block)



/********** 系统版本 ***********/

#define Current_Version ([[[UIDevice currentDevice] systemVersion] floatValue])
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//是否为iOS6
#define iOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? YES : NO)
//是否为iOS7
#define iOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
//是否为iOS8
#define iOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
//是否为iOS9
#define iOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)
//是否为iOS10
#define iOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) ? YES : NO)



/********** 颜色 ***********/

//设置颜色
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
//设置颜色、透明度
#define ColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//随机色
#define ColorRandom Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
//16进制
#define ColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ColorClear [UIColor clearColor]        // 无色
#define ColorBlack [UIColor blackColor]        // 黑色
#define ColorDarkGray [UIColor darkGrayColor]  // 深灰色
#define ColorLightGray [UIColor lightGrayColor]// 浅灰色
#define ColorWhite [UIColor whiteColor]        // 白色
#define ColorGrayColor [UIColor grayColor]     // 灰色
#define ColorRed [UIColor redColor]            // 红色
#define ColorGreen [UIColor greenColor]        // 绿色
#define ColorBlue [UIColor blueColor]          // 蓝色
#define ColorCyan [UIColor cyanColor]          // 青色
#define ColorYellow [UIColor yellowColor]      // 黄色
#define ColorMagenta [UIColor magentaColor]    // 绛红色
#define ColorOrange [UIColor orangeColor]      // 橙色
#define ColorPurple [UIColor purpleColor]      // 紫色
#define ColorBrown [UIColor brownColor]        // 棕色



/********** debug下打印，release下不打印 ***********/

#ifndef DEBUG
//输出String
#define PSSLog(...) NSLog(__VA_ARGS__)
//输出Point
#define PSSLogPoint(point)    NSLog(@"%s = { x:%.4f, y:%.4f }", #point, point.x, point.y)
//输出Size
#define PSSLogSize(size)      NSLog(@"%s = { w:%.4f, h:%.4f }", #size, size.width, size.height)
//输出Rect
#define PSSLogRect(rect)      NSLog(@"%s = { x:%.4f, y:%.4f, w:%.4f, h:%.4f }", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#else
//#define NSLog(...) {}
#endif


/********** 快速查询一段代码的执行时间 ***********/

//开始计时
#define PSSStartCK NSDate *startTime = [NSDate date];
//结束计时并打印
#define PSSEndCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);



/********** 字体 ***********/

// 设置字体和字体尺寸
#define PSSSetFont(fontName,font)    [UIFont fontWithName:(fontName) size:(font)]



/********** 控件尺寸 ***********/

//屏幕的宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕的高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//TabBar的高度
#define TabBarH        49.0f
//状态栏高度
#define StatusBarH     20.0f
//导航栏高度
#define NavigationBarH 44.0f
//SCREEN_WIDTH-20
#define MAX_WIDTH_10        (SCREEN_WIDTH-20)
//SCREEN_WIDTH-30
#define MAX_WIDTH_15        (SCREEN_WIDTH-30)
// cellH
#define CellH        60




/********** Retina、iPhone、iPad、iPhone的那款机型 ***********/

//是否是Retina屏幕
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//是否是iPhone
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//是否是iPad
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//是否是iPod
#define isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
//是否是iPhone4
#define isiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x
#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//是否为iPhone 6/7 分辨率375x667，像素750x1334，@2x
#define isiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//是否为iPhone 6/7 Plus 分辨率414x736，像素1242x2208，@3x
#define isiPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


// 返回一个字符串
#define stringify   __STRING

#endif /* PSSConfig_h */
