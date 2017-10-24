//
//  Test5ViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/16.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "Test5ViewController.h"

#import "JDLBaiSiBaseViewController.h"

#define contentWidth self.contentV.bounds.size.width
#define contentHeight self.contentV.bounds.size.height
@interface Test5ViewController ()<TGSegmentBarDelegate,UIScrollViewDelegate>
{
    CGFloat _beginDraggingContentOffsetX;
    NSInteger _circleIndex;
}
@property (nonatomic, weak) UIScrollView *contentV;
@end

@implementation Test5ViewController

#pragma mark - 以下为懒加载
- (TGSegmentBar *)segmentBar {
    if (!_segmentBar) {
        TGSegmentBar *segmentBar = [TGSegmentBar segmentBarWithFrame:CGRectZero config:nil parentView:self.view];
        segmentBar.delegate = self;//代理的使用 2
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}

- (UIScrollView *)contentV {
    if (!_contentV) {
        UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.segmentBar.frame), KScreenWidth , KScreenHeight -CGRectGetMaxY(self.segmentBar.frame))];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        contentView.scrollsToTop = NO;
        contentView.showsVerticalScrollIndicator = YES;
        contentView.showsHorizontalScrollIndicator = YES;
        contentView.tag = 9999;
        [self.view addSubview:contentView];
        _contentV = contentView;
    }
    return _contentV;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =KRedColor;
    
    //推荐
    NSString *test1 = @"http://s.budejie.com/topic/list/jingxuan/1/bs0315-iphone-4.5.6/";
    //随听
    NSString *test2 = @"http://s.budejie.com/topic/list/zuixin/31/bs0315-iphone-4.5.6/";
    //视频
    NSString *test3 = @"http://s.budejie.com/topic/list/jingxuan/41/bs0315-iphone-4.5.6/";
    //图片
    NSString *test4 = @"http://s.budejie.com/topic/list/jingxuan/10/bs0315-iphone-4.5.6/";
    //段子
    NSString *test5 = @"http://s.budejie.com/topic/tag-topic/64/hot/bs0315-iphone-4.5.6/";
    //排行
    NSString *test6 = @"http://s.budejie.com/topic/list/remen/1/bs0315-iphone-4.5.6/";
    //互动区
    NSString *test7 = @"http://s.budejie.com/topic/tag-topic/44289/hot/bs0315-iphone-4.5.6/";
    //网红
    NSString *test8 = @"http://s.budejie.com/topic/tag-topic/3096/hot/bs0315-iphone-4.5.6/";
    //社会
    NSString *test9 = @"http://s.budejie.com/topic/tag-topic/473/hot/bs0315-iphone-4.5.6/";
    //投票
    NSString *test10 = @"http://s.budejie.com/topic/tag-topic/6513/hot/bs0315-iphone-4.5.6/";
    //美女
    NSString *test11 = @"http://s.budejie.com/topic/tag-topic/117/hot/bs0315-iphone-4.5.6/";
    //冷知识
    NSString *test12= @"http://s.budejie.com/topic/tag-topic/3176/hot/bs0315-iphone-4.5.6/";
    //游戏
    NSString *test13 = @"http://s.budejie.com/topic/tag-topic/164/hot/bs0315-iphone-4.5.6/";
    
    NSArray *items = @[@"推荐",@"随听", @"视频", @"图片", @"段子",@"排行",@"互动区",@"网红",@"社会",@"投票",@"美女",@"冷知识",@"游戏"];
    NSArray *urls = @[test1,test2, test3, test4, test5,test6,test7,test8,test9,test10,test11,test12,test13];
    NSMutableArray *vcArrays =[NSMutableArray array];
    for (int i =0; i <items.count; i ++) {
        JDLBaiSiBaseViewController *vc =[[JDLBaiSiBaseViewController alloc] init];
        vc.topTitle =items[i];
        vc.requestUrl =urls[i];
        [self addChildViewController:vc];
        [vcArrays addObject:vc];
    }
    self.segmentBar.frame =CGRectMake(0, 20, KScreenWidth, 40);
    self.segmentBar.segmentModels =items;
    self.contentV.contentSize = CGSizeMake(items.count * KScreenWidth, 0);
    [self.segmentBar updateViewWithConfig:^(TGSegmentConfig *config) {
        config.selectedColor(KWhiteColor)
        .normalColor(KWhiteColor)
        .selectedFont([UIFont systemFontOfSize:14])//选中字体大于其他正常标签的字体的情况下，根据情况稍微调大margin（默认8），以免选中的字体变大后挡住其他正常标签的内容
        .normalFont([UIFont systemFontOfSize:13])
        .indicateExtraW(8)
        .indicateH(2)
        .indicateColor([UIColor whiteColor])
        .showMore(NO)//是否显示更多面板
        .circleScroll(NO)//是否循环滚动，第0个再向前，那么到最后一个;最后一个向后，那么到第0个
        .moreCellBGColor([[UIColor grayColor] colorWithAlphaComponent:0.3])
        .moreBGColor([UIColor clearColor])
        .moreCellFont([UIFont systemFontOfSize:13])
        .moreCellTextColor(KWhiteColor)
        .moreCellMinH(30)
        .showMoreBtnlineView(YES)
        .moreBtnlineViewColor([UIColor lightTextColor])
        .moreBtnTitleFont([UIFont systemFontOfSize:13])
        .moreBtnTitleColor([UIColor lightTextColor])
        .margin(18)
        .barBGColor(KRedColor)
        ;
    }];
}

#pragma mark segmentBar代理
-(void)segmentBar:(TGSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex{
    
    [self showChildViewcontrollersWith:toIndex];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //TGLog(@"scrollViewWillBeginDragging %f",self.contentV.contentOffset.x);
    _beginDraggingContentOffsetX = self.contentV.contentOffset.x;
}

-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //TGLog(@"scrollViewWillEndDragging %f",self.contentV.contentOffset.x);
    CGFloat willEndDraggingContentOffsetX = self.contentV.contentOffset.x;
    if (willEndDraggingContentOffsetX < -self.segmentBar.segmentConfig.circleScrollOffset  && _beginDraggingContentOffsetX == 0){//滚到最后一个去
        _circleIndex = scrollView.contentSize.width / contentWidth - 1;
    }else if (willEndDraggingContentOffsetX + self.contentV.frame.size.width - scrollView.contentSize.width > self.segmentBar.segmentConfig.circleScrollOffset && _beginDraggingContentOffsetX == scrollView.contentSize.width - self.contentV.frame.size.width){//滚到第一个去
        _circleIndex = 0;
    }else {
        _circleIndex = -1;
    }
    _circleIndex = self.segmentBar.segmentConfig.isCircleScroll ? _circleIndex : -1;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //NSInteger index = self.contentV.contentOffset.x / self.contentV.width;
    //[self showChildVCViewsAtIndex:index];
    self.segmentBar.selectedIndex = ((_circleIndex == -1) ? (self.contentV.contentOffset.x / contentWidth) : _circleIndex);
}


-(void)showChildViewcontrollersWith:(NSInteger )index{
    
    JDLBaiSiBaseViewController *vc =self.childViewControllers[index];
//    vc.view.backgroundColor =KYellowColor;
    vc.view.frame = CGRectMake(index * self.contentV.bounds.size.width, 0, self.contentV.bounds.size.width, self.contentV.bounds.size.height);
    [self.contentV addSubview:vc.view];
    [self.contentV setContentOffset:CGPointMake(self.contentV.bounds.size.width *index, 0) animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
