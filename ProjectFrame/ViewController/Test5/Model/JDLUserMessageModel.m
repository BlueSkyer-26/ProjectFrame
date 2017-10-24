//
//  JDLUserMessageModel.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLUserMessageModel.h"

@implementation JDLUserMessageModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
        @"ID" : @"id",
        @"header" : @"header[0]",
    };
}

@end
