//
//  UIViewController+PopBlock.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PopBlock)(UIBarButtonItem *backItem);

@interface UIViewController (PopBlock)

@property(nonatomic,copy)PopBlock popBlock;

@end
