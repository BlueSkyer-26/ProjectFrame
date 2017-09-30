//
//  BaseLabel.m
//  SuperEducation
//
//  Created by 123 on 2017/2/28.
//  Copyright © 2017年 luoqi. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

//自适应宽度
- (CGSize)adaptiveWidth:(NSString *)str label:(BaseLabel *)label{
    
    //重要的是下面这部分哦！
    CGSize titleSize = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:label.font.fontName size:label.font.pointSize]}];
    
    titleSize.height = 20 * KSCALE_HEIGHT;
    titleSize.width += 15 * KSCALE_HEIGHT;
    
    return titleSize;
}

@end
