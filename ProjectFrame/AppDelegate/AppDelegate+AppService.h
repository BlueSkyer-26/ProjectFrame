//
//  AppDelegate+AppService.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "AppDelegate.h"

#import "JDLTabbarController.h"
#import "JDLTabbarPlusButton.h"

@interface AppDelegate (AppService)<UITabBarControllerDelegate, CYLTabBarControllerDelegate>

/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */

//初始化window
-(void)initWindow;

//初始化tabbar
-(void)initTabbarController;

//适配iOS11
-(void)adaptationNewIOS;

//监听网络状态
-(void)monitorNetworkStatus;















@end
