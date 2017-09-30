//
//  JDLHomeScrollModel.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeScrollModel.h"

@implementation JDLHomeScrollModel

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"id" : @"scrollId"}];
}

@end
