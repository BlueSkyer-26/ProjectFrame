//
//  UIViewController+PopBlock.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "UIViewController+PopBlock.h"
#import <objc/runtime.h>

@implementation UIViewController (PopBlock)

-(void)setPopBlock:(PopBlock)popBlock{
    
    objc_setAssociatedObject(self, @selector(popBlock), popBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(PopBlock)popBlock{
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
