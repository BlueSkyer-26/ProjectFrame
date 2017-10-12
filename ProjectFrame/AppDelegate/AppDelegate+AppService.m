//
//  AppDelegate+AppService.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
}

#pragma mark 初始化Tabbar
-(void)initTabbarController{
    
    //添加中间突出按钮
    [JDLTabbarPlusButton registerPlusButton];
    
    JDLTabbarController *tabBarControllerConfig = [[JDLTabbarController alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    //设置tabbar样式
    [self setTabbarBadgeTypeWithTabbar:tabBarController];
    //设置导航样式
    //    [self setUpNavigationBarAppearance];
    [self.window setRootViewController:tabBarController];
}

#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {

        switch (networkStatus) {
                // 未知网络
            case PPNetworkStatusUnknown:
                WMLog(@"网络环境：未知网络");
                // 无网络
            case PPNetworkStatusNotReachable:
                WMLog(@"网络环境：无网络");
                KPostNotification(KNotificationNetWorkStateChange, @NO);
                break;
                // 手机网络
            case PPNetworkStatusReachableViaWWAN:
                WMLog(@"网络环境：手机自带网络");
                // 无线网络
            case PPNetworkStatusReachableViaWiFi:
                WMLog(@"网络环境：WiFi");
                KPostNotification(KNotificationNetWorkStateChange, @YES);
                break;
        }

    }];
    
}

#pragma mark ————— 第一次启动引导页 —————
-(void)loadGuideVC {
//    if (![kUserDefaults boolForKey:@"firstLaunch"]) {
//        [kUserDefaults setBool:YES forKey:@"firstLaunch"];
//        [kUserDefaults synchronize];
//        //如果是第一次启动,使用UserGuideViewController (用户引导页面) 作为根视图
//        self.window.rootViewController = [[UserGuideViewController alloc]init];
//    }
//    else {
//        self.window.rootViewController = self.rootTabbar = [[RootTabbarController alloc]init];
//    }
}

//设置tabbar样式
-(void)setTabbarBadgeTypeWithTabbar:(CYLTabBarController *)tabBarController{
    
    [tabBarController setViewDidLayoutSubViewsBlock:^(CYLTabBarController *aTabBarController) {

        UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[0] cyl_setTabBadgePointView:tabBadgePointView0];
        [aTabBarController.viewControllers[0] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
        [aTabBarController.viewControllers[1] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
        [aTabBarController.viewControllers[2] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView3 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[3] cyl_setTabBadgePointView:tabBadgePointView3];
        [aTabBarController.viewControllers[3] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView4 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[4] cyl_setTabBadgePointView:tabBadgePointView4];
        [aTabBarController.viewControllers[4] cyl_showTabBadgePoint];
        
        //添加提示动画，引导用户点击
        [self addScaleAnimationOnView:aTabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20 isAnimation:YES];
    }];
    
    tabBarController.delegate = self;
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName : KBlackColor,
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : KBlackColor,
                           UITextAttributeTextShadowColor : KClearColor,
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}


#pragma mark - delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    
//    WMLog(@"点击了tabbar-----%lu",(unsigned long)tabBarController.selectedIndex);
    UIView *animationView;
    if ([control cyl_isTabButton]) {
        //更改红标状态  点 或 数字
//        if ([[self cyl_tabBarController].selectedViewController cyl_isShowTabBadgePoint]) {
//            [[self cyl_tabBarController].selectedViewController cyl_removeTabBadgePoint];
//        } else {
//            [[self cyl_tabBarController].selectedViewController cyl_showTabBadgePoint];
//        }
        
        animationView = [control cyl_tabImageView];
    }
    
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    //中间按钮是否需要动画
    if ([control cyl_isPlusButton]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    }
    
//    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
    [self addScaleAnimationOnView:animationView repeatCount:1 isAnimation:YES];
//    } else {
//        [self addRotateAnimationOnView:animationView];
//    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount isAnimation:(BOOL)isAnimtion{
    if (isAnimtion) {
        //需要实现的帧动画，这里根据需求自定义
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.values = @[@1.0,@1.2,@0.9,@1.15,@0.95,@1.02,@1.0];
        animation.duration = 0.8;
        animation.repeatCount = repeatCount;
        animation.calculationMode = kCAAnimationCubic;
        [animationView.layer addAnimation:animation forKey:nil];
    }
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}

#pragma mark 适配iOS11
-(void)adaptationNewIOS{
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}


@end
