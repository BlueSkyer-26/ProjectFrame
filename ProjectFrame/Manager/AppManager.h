//
//  AppManager.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/27.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 包含应用层的相关服务
 */
@interface AppManager : NSObject

#pragma mark ————— APP启动接口 —————
+(void)appStart;

#pragma mark ————— FPS 监测 —————
+(void)showFPS;

@end
