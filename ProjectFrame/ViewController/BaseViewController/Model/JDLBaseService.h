//
//  JDLBaseService.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLBaseService : NSObject

@property (nonatomic,weak) UIViewController *baseVc;

-(instancetype)initWithVC:(UIViewController *)VC ViewModel:(NSObject *)viewModel;

+(instancetype)serviceWithVC:(UIViewController *)VC ViewModel:(NSObject *)viewModel;

@end
