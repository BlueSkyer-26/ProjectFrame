//
//  JDLBaseService.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLBaseService.h"

@implementation JDLBaseService

+(instancetype)serviceWithVC:(UIViewController *)VC ViewModel:(NSObject *)viewModel{
    
    return [[self alloc] initWithVC:VC ViewModel:viewModel];
}

-(instancetype)initWithVC:(UIViewController *)VC ViewModel:(NSObject *)viewModel{
    
    if (self = [super init]) {
        self.baseVc = VC;
    }
    return self;
}

@end
