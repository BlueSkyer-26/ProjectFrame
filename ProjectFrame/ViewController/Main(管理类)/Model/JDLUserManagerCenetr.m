//
//  JDLUserManagerCenetr.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLUserManagerCenetr.h"

@implementation JDLUserManagerCenetr

+(instancetype)shareInstance{
    
    static JDLUserManagerCenetr *userCenetr =nil;
    static dispatch_once_t onetoken;
    dispatch_once(&onetoken, ^{
        userCenetr = [[JDLUserManagerCenetr alloc] init];
    });
    return userCenetr;
}

@end
