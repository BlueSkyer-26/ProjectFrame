//
//  BaseTextField.m
//  SuperEducation
//
//  Created by 123 on 2017/2/28.
//  Copyright © 2017年 luoqi. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

// 控制placeHolder的位置，左右缩20，但是光标位置不变

//-(CGRect)placeholderRectForBounds:(CGRect)bounds
// {
// CGRect inset = CGRectMake(bounds.origin.x+100, bounds.origin.y, bounds.size.width -10, bounds.size.height);
// return inset;
//}

//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(self.leftView.bounds.size.width +10, bounds.origin.y, bounds.size.width-25 - self.leftView.bounds.size.width, bounds.size.height);
}

// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(self.leftView.bounds.size.width +10, bounds.origin.y, bounds.size.width-25 - self.leftView.bounds.size.width, bounds.size.height);
    return inset;
}

@end
