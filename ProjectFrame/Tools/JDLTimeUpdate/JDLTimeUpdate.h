//
//  JDLTimeUpdate.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLTimeUpdate : NSObject

+ (CGFloat)autoHeightLabelSize:(CGSize)size font:(CGFloat)font text:(NSString *)text;

+ (CGFloat)autoWidthLabelSize:(CGSize)size font:(CGFloat)font text:(NSString *)text;

+(NSString *)updateTimeWithPassTime:(NSString *)passtime;

@end
