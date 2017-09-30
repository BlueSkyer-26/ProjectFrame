//
//  JDLHomeNavigationView.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeNavigationView.h"

@interface JDLHomeNavigationView()

@end

@implementation JDLHomeNavigationView

-(instancetype)initWithFrame:(CGRect)frame NavigationType:(NavigationType)navigationType{
    
    if (self =[super initWithFrame:frame]) {
        
        _navigationType = navigationType;
        
        [self createNavigationView];
    }
    return self;
}

-(void)createNavigationView{
    
    self.backgroundColor =KClearColor;
    
    self.scanButton = [JDLFactory buttonWithTitle:@"扫码" image:kImageName(@"JDMainPage_icon_scan_18x18_") frame:CGRectMake(kMarginBetween, kStatusHeight, 44, 44) font:SYSTEMFONT(KAdaptX(11)) fontColor:KWhiteColor];
    [self.scanButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:5];
    [self addSubview:self.scanButton];
    
    self.searchButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    self.searchButton.frame =CGRectMake(self.scanButton.right +kMarginBetween,kStatusHeight +7, self.width -4*kMarginBetween -2*self.scanButton.width, 30);
    self.searchButton.layer.cornerRadius = self.searchButton.height *0.5;
    self.searchButton.layer.masksToBounds = YES;
    self.searchButton.backgroundColor =KWhiteAlphaColor(0.4);
    [self addSubview:self.searchButton];
    
    self.searchImageView =[JDLFactory imageViewWithImage:kImageName(@"JDMainPage_icon_search_15x15_") frame:CGRectMake(10, 7.5, 15, 15) contentMode:UIViewContentModeScaleAspectFit];
    [self.searchButton addSubview:self.searchImageView];
    
    self.searchLabel =[JDLFactory labelWithText:@"搜索商品" frame:CGRectMake(self.searchImageView.right +kMarginBetween, 0, self.searchButton.width -15-self.searchImageView.width, self.searchButton.height) textFont:SYSTEMFONT(KAdaptX(14)) textColor:KWhiteColor];
    [self.searchButton addSubview:self.searchLabel];
    
    self.messageButton = [JDLFactory buttonWithTitle:@"消息" image:kImageName(@"JDMainPage_icon_message_18x18_") frame:CGRectMake(self.width -kMarginBetween -44, kStatusHeight, 44, 44) font:SYSTEMFONT(KAdaptX(11)) fontColor:KWhiteColor];
    [self.messageButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:5];
    [self addSubview:self.messageButton];
    
//    self.layer.shadowPath = [self getShadowPath].CGPath;
    
    switch (_navigationType) {
        case NavigationTypeHome:
            WMLog(@"NavigationTypeHome");
            break;
        case NavigationTypeCategory:
            WMLog(@"NavigationTypeCategory");
            break;
        case NavigationTypeList:
            WMLog(@"NavigationTypeList");
            break;
            
        default:
            break;
    }
}

-(UIBezierPath *)getShadowPath{
    
    //添加阴影
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    self.layer.shadowOffset = CGSizeMake(0,0);
    self.layer.shadowRadius = 4;//阴影半径，默认3
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, self.height-1)];
    [path addLineToPoint:CGPointMake(self.width, self.height-1)];
    [path addLineToPoint:CGPointMake(self.width, self.height+2)];
    [path addLineToPoint:CGPointMake(0, self.height+2)];
    [path addLineToPoint:CGPointMake(0, self.height-1)];
    return path;
}



















@end
