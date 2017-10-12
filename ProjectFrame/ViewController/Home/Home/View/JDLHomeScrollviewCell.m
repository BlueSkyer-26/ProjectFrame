//
//  JDLHomeScrollviewCell.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/29.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeScrollviewCell.h"

#import "JDLNewsViewController.h"

#import "JDLListBaseModel.h"

@interface JDLHomeScrollviewCell()<SDCycleScrollViewDelegate>

@property (nonatomic,weak)JDLListCellItemModel      *model;

@property (nonatomic,strong)SDCycleScrollView       *cycleScrollview;

@end

@implementation JDLHomeScrollviewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        self.backgroundColor =KClearColor;
        //创建头部轮番图
        [self createScrollviewUI];
    }
    return self;
}

-(void)createScrollviewUI{
    
    self.cycleScrollview = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageNamesGroup:nil];
    self.cycleScrollview.delegate =self;
    self.cycleScrollview.backgroundColor = KClearColor;
    self.cycleScrollview.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.cycleScrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollview.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    self.cycleScrollview.pageDotImage = kImageName(@"YCMainPage_Banner_Index");
    self.cycleScrollview.currentPageDotImage = kImageName(@"YCMainPage_Banner_Index_Selected");
    self.cycleScrollview.autoScrollTimeInterval = 3.0f;
    [self.contentView addSubview:self.cycleScrollview];
}

-(void)updateItemCellModel:(id )itemModel{
    
    if ([itemModel isKindOfClass:[JDLListCellItemModel class]]) {
        self.model =(JDLListCellItemModel *)itemModel;
        self.cycleScrollview.imageURLStringsGroup =self.model.valueOfRowItemCellData;
    }
    
}

//重写高度
+(CGFloat)getItemCellHeightWithModel:(id)itemModel{
    
    return 160 *KSCALE_HEIGHT;
}

#pragma mark SDCycleScrollView代理方法

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    [self.homeVC.navigationController pushViewController:[[JDLNewsViewController alloc]init] animated:YES];
    WMLog(@"6666====%ld",(long)index);
    
}

@end
