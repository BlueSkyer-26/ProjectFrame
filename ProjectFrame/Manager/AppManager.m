//
//  AppManager.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/27.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "AppManager.h"
#import "AdPageView.h"
#import "BaseWebViewController.h"
#import "JDLShowFPS.h"

@implementation AppManager

+(void)appStart{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:kScreen_Bounds withTapBlock:^{
        BaseWebViewController *WebVc = [[BaseWebViewController alloc] init];
        WebVc.urlString = kNSStringFormat(@"%@",@"http://www.hao123.com");
        BaseNavigationController *loginNavi =[[BaseNavigationController alloc] initWithRootViewController:WebVc];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
    adView = adView;
}
#pragma mark ————— FPS 监测 —————
+(void)showFPS{
    JDLShowFPS *_fpsLabel = [JDLShowFPS new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = KScreenHeight - 55;
    _fpsLabel.right = KScreenWidth - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
}

@end
