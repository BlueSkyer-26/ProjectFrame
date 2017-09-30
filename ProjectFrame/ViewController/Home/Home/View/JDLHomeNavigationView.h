//
//  JDLHomeNavigationView.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,NavigationType){
    NavigationTypeHome =1,
    NavigationTypeCategory,
    NavigationTypeList
};

@interface JDLHomeNavigationView : UIView

@property(nonatomic,assign)NavigationType navigationType;

@property(nonatomic,strong)BaseButton       *messageButton;
@property(nonatomic,strong)BaseButton       *scanButton;
@property(nonatomic,strong)BaseButton       *searchButton;
@property(nonatomic,strong)BaseLabel        *searchLabel;
@property(nonatomic,strong)BaseImageView    *searchImageView;

-(instancetype)initWithFrame:(CGRect)frame NavigationType:(NavigationType )navigationType;

@end
