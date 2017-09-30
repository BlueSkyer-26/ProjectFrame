//
//  JDLHomeUIService.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeUIService.h"

#import "JDLHomeViewModel.h"
#import "JDLListBaseModel.h"

#import "JDLHomeNavigationView.h"

#import "JDLHomeScrollviewCell.h"

#import "JDLHomeViewController.h"


@interface JDLHomeUIService()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong)JDLHomeViewModel      *viewModel;
@property (nonatomic,weak)JDLHomeViewController   *homeVC;

@property (nonatomic,strong)JDLHomeNavigationView *homeNavigationView;

@end

@implementation JDLHomeUIService

-(instancetype)initWithVC:(UIViewController *)VC ViewModel:(NSObject *)viewModel{
    
    if (self =[super initWithVC:VC ViewModel:viewModel]) {
        
        _homeVC = (JDLHomeViewController *)VC;
        _viewModel = (JDLHomeViewModel *)viewModel;
        [_homeVC.view addSubview:self.homeCollectionView];
        
        RACSignal *deallocSignal_viewWillDisappear =[self.homeVC rac_signalForSelector:@selector(viewWillDisappear:)];
        RACSignal *deallocSignal_viewWillappear =[self.homeVC rac_signalForSelector:@selector(viewWillAppear:)];
        
        [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil]
            takeUntil:deallocSignal_viewWillDisappear]
            subscribeNext:^(NSNotification * x) {
             WMLog(@"RAC--deallocSignal_viewWillDisappear--%@",x);
         }];
        
        [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidBecomeActiveNotification object:nil]
            takeUntil:deallocSignal_viewWillappear]
            subscribeNext:^(NSNotification * x) {
             WMLog(@"RAC--deallocSignal_viewWillappear--%@",x);
         }];
        
        //创建头部navigationBar
        [self createNavigationBar];
        //请求home数据
        [self requestHomeData];
    }
    return self;
}

-(void)createNavigationBar{
    
    self.homeNavigationView = [[JDLHomeNavigationView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kNavbarHeight) NavigationType:NavigationTypeHome];
    [self.homeVC.view addSubview:self.homeNavigationView];
//    WEAK
    //扫一扫
    [[self.homeNavigationView.scanButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
//        STRONG
        WMLog(@"扫一扫");
    }];
    //搜索
    [[self.homeNavigationView.searchButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        WMLog(@"搜索");
    }];
    //消息
    [[self.homeNavigationView.messageButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        WMLog(@"消息");
    }];
}

-(void)requestHomeData{
    
    [self.viewModel.floorSignal subscribeNext:^(id x) {
        
        NSLog(@"home=====%@",x);
        [self.homeCollectionView.mj_header endRefreshing];
        [self.homeCollectionView reloadData];
        
    } error:^(NSError *error) {
        
        [self.homeCollectionView.mj_header endRefreshing];
        
    }];
}

-(void)startTimer{
    
}

-(void)stopTimer{
    
}

-(UICollectionView *)homeCollectionView{
    
    if (!_homeCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _homeCollectionView = [[UICollectionView alloc] initWithFrame:self.homeVC.view.bounds collectionViewLayout:layout];
        _homeCollectionView.dataSource =self;
        _homeCollectionView.delegate =self;
        _homeCollectionView.backgroundColor =KGrayColor;
        NSArray *cellIDArray = @[
                                 @"JDLHomeScrollviewCell"
//                                 @"YBLHomeButtonsCell",
//                                 @"YBLHomeSeckillCell",
//                                 @"YBLHomeModuleCell",
//                                 @"YBLCategoryItemCell",
//                                 @"YBLExpressNewsCell"
                                 ];
        for (NSString *cellID in cellIDArray) {
            
            [_homeCollectionView registerClass:NSClassFromString(cellID) forCellWithReuseIdentifier:cellID];
        }
//        [_homeCollectionView registerClass:NSClassFromString(@"JDLHomeScrollviewCell") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JDLHomeScrollviewCell"];
        
    }
    return _homeCollectionView;
}

#pragma mark  colleoction datasource/delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.viewModel.cell_data_dict.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    JDLListBaseModel *sectionModel = self.viewModel.cell_data_dict[@(section)];
    return [sectionModel.identifierOfSectionCellItemArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    JDLListBaseModel *sectionModel = self.viewModel.cell_data_dict[@(section)];
    JDLListCellItemModel *cellModel = sectionModel.identifierOfSectionCellItemArray[row];
    NSString *cellName = cellModel.identifierOfRowItemCell;
    WMLog(@"萨瓦迪卡====%@",cellName);
//
//    if (section>2&&section<=self.viewModel.cell_data_dict.count-2) {
//        self.topCommandButton.selected = YES;
//        self.topCommandButton.hidden = NO;
//    } else if (section >= self.viewModel.cell_data_dict.count-1){
//        self.topCommandButton.selected = NO;
//        self.topCommandButton.hidden = NO;
//    } else {
//        self.topCommandButton.hidden = YES;
//    }
//
//    WEAK
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];

    if ([cellName isEqualToString:@"JDLHomeScrollviewCell"]) {
        JDLHomeScrollviewCell *bannerCell = (JDLHomeScrollviewCell *)cell;
//        bannerCell.barrageView.dataArray = self.viewModel.oderBulletArray;
//        bannerCell.barrageView.isStopRunning = self.viewModel.isRunBullets;
        bannerCell.homeVC = self.homeVC;

    }
//    else if([cellName isEqualToString:@"YBLHomeButtonsCell"]){
//        YBLHomeButtonsCell *buttonsCell = (YBLHomeButtonsCell *)cell;
//        buttonsCell.buttonsClickBlock = ^(NSInteger index) {
//            STRONG
//            NSString *className = self.viewModel.buttonClassNameArray[index];
//            id classVc;
//            if ([className isEqualToString:@"YBLMineMillionMessageViewController"]) {
//                if (![YBLMethodTools checkLoginWithVc:self.homeVC]) {
//                    return;
//                }
//                YBLMineMillionMessageViewModel *viewModel = [YBLMineMillionMessageViewModel new];
//                viewModel.millionType = MillionTypePublic;
//                YBLMineMillionMessageViewController *millionVc = [YBLMineMillionMessageViewController new];
//                millionVc.viewModel = viewModel;
//                classVc = millionVc;
//            } else {
//                if ([className isEqualToString:@"YBLCouponsCenterViewController"]) {
//                    if (![YBLMethodTools checkLoginWithVc:self.homeVC]) {
//                        return;
//                    }
//                }
//                classVc = [NSClassFromString(className) new];
//            }
//            [self.homeVC.navigationController pushViewController:classVc animated:YES];
//        };
//
//    }else if([cellName isEqualToString:@"YBLExpressNewsCell"]){
//
//        YBLExpressNewsCell *expressCell = (YBLExpressNewsCell *)cell;
//
//        [[[expressCell.moreButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:cell.rac_prepareForReuseSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
//            STRONG
//            YBLFoundTabBarViewController *foundTabBarVC = [YBLFoundTabBarViewController new];
//            [self.homeVC.navigationController pushViewController:foundTabBarVC animated:YES];
//        }];
//
//        expressCell.expressNewsCellScrollClickBlock = ^(YBLPushPurchaseInfoModel *infoModel) {
//            STRONG
//            if (![YBLMethodTools checkLoginWithVc:self.homeVC]) {
//                return ;
//            }
//            YBLPurchaseGoodDetailViewModel *viewModel = [YBLPurchaseGoodDetailViewModel new];
//            YBLPurchaseOrderModel *purchseModel = [YBLPurchaseOrderModel new];
//            purchseModel._id = infoModel.id;
//            viewModel.purchaseDetailModel = purchseModel;
//            YBLPurchaseGoodsDetailVC *detailVC = [[YBLPurchaseGoodsDetailVC alloc] init];
//            detailVC.viewModel = viewModel;
//            [self.homeVC.navigationController pushViewController:detailVC animated:YES];
//        };
//
//
//    }else if([cellName isEqualToString:@"YBLHomeSeckillCell"]){
//
//        //        YBLHomeSeckillCell *seckillCell = (YBLHomeSeckillCell *)cell;
//
//    } else if([cellName isEqualToString:@"YBLHomeModuleCell"]){
//
//        YBLHomeModuleCell *moduleCell = (YBLHomeModuleCell *)cell;
//        moduleCell.moduleClickblock = ^(NSInteger index){
//            STRONG
//            [self reciveIndex:index section:section];
//        };
//
//    } else  if([cellName isEqualToString:@"YBLCategoryItemCell"]){
//
//        YBLCategoryItemCell *recommendGoodCell = (YBLCategoryItemCell *)cell;
//        recommendGoodCell.isListType = NO;
//    }
//
//
    [cell updateItemCellModel:cellModel];
    return cell;
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//
////    NSInteger section =indexPath.section;
//    UICollectionReusableView *reusableView =nil;
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//
//
//    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//
//
//    }
//    return reusableView;
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section =indexPath.section;
    NSInteger row = indexPath.row;
    
    JDLListBaseModel *sectionModel = self.viewModel.cell_data_dict[@(section)];
    JDLListCellItemModel *cellModel = sectionModel.identifierOfSectionCellItemArray[row];
    NSString *cellName = cellModel.identifierOfRowItemCell;
    if ([cellName isEqualToString:@"JDLHomeScrollviewCell"]) {
        return CGSizeMake(KScreenWidth, [JDLHomeScrollviewCell getItemCellHeightWithModel:cellModel]);
    }
    return CGSizeMake(kScreenWidth,50);
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section{
    
    JDLListBaseModel *sectionModel = self.viewModel.cell_data_dict[@(section)];
    JDLListCellItemModel *cellModel = sectionModel.identifierOfSectionCellItemArray[0];
    NSString *cellName = cellModel.identifierOfRowItemCell;
//    if ([cellName isEqualToString:@"YBLCategoryItemCell"]){
        return UIEdgeInsetsMake(0, 5, 0, 5);
//    }
//    return UIEdgeInsetsZero;
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    JDLListBaseModel *sectionModel = self.viewModel.cell_data_dict[@(section)];
    JDLListCellItemModel *cellModel = sectionModel.identifierOfSectionCellItemArray[0];
    NSString *cellName = cellModel.identifierOfRowItemCell;
//    if ([cellName isEqualToString:@"YBLCategoryItemCell"]){
//        return 5;
//    }
    return 5;
}

@end
