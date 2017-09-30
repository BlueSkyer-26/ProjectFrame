//
//  JDLLoadingView.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDLLoadingView : UIView

-(void)show;

-(void)dismiss;

+(void)showInView:(UIView*)view;

+(void)dismissInView:(UIView*)view;

+ (void)showInWindow;

+ (void)dismissInWindow;

@end
