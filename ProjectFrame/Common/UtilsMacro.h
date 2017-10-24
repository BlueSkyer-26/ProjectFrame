//
//  Macro.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#ifndef Macro_h
#define Macro_h



//是否是iPhone X
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)


///适配相关
//获取屏幕宽高
#define KScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

#define KSCALE_WIDTH [UIScreen mainScreen].bounds.size.width/375
#define KSCALE_HEIGHT [UIScreen mainScreen].bounds.size.height/667

#define KAdaptX(x) [UIScreen mainScreen].bounds.size.width / 375 * x
#define KAdaptY(y) [UIScreen mainScreen].bounds.size.height / 667 * y
#define KHAdaptX(x) [UIScreen mainScreen].bounds.size.width / 667 * x
#define KHAdaptY(y) [UIScreen mainScreen].bounds.size.height / 375 * y
#define KLeftPadding AdaptX(10)

#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )
#define kIOS7DELTA   ((kDeviceVersion>=7.0)? 20 :0 )
#define kTabBarHeight 49
#define kMarginBetween 5
#define kStatusHeight 20
#define kPolicyDetailHeaderViewHeight 77.f
#define kReimbursedByThirdPartyButtonTag 500
#define kIphone5TextFont 13.f


//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];
/** 设置图片 */
#define kImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


//拼接字符串
#define kNSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

#define kSafeString(__X__)        [__X__ isKindOfClass:[NSNull class]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

/** 获取坐标 */
#define KLeft(Rect) CGRectGetMinX(Rect)
#define KTop(Rect) CGRectGetMinY(Rect)
#define KRight(Rect) CGRectGetMaxX(Rect)
#define KBottom(Rect) CGRectGetMaxY(Rect)
#define KWidth(Rect) CGRectGetWidth(Rect)
#define KHeight(Rect) CGRectGetHeight(Rect)
#define KCenterY(Rect) CGRectGetMidY(Rect)
#define KCenterX(Rect) CGRectGetMidX(Rect)

/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

#define WEAK  @weakify(self);

#define STRONG  @strongify(self);

/** 避免self的提前释放 */
#define STRONGSELF __weak typeof(weakSelf) strongSelf = weakSelf

///** 修改Log,debug：WMLog，执行NSLog，release，自动忽略 */
#ifdef DEBUG
#define WMLog(FORMAT, ...) fprintf(stderr, "%s:%zd\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define WMLog(FORMAT, ...) nil
#endif


//#ifdef DEBUG
//#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
////#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
//#else
//#define NSLog(format, ...)
//#endif









#endif /* Macro_h */
