//
//  JDLHomeViewModel.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/29.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeViewModel.h"

#import "JDLListBaseModel.h"
#import "JDLHomeScrollModel.h"

@interface JDLHomeViewModel()

@end

@implementation JDLHomeViewModel


- (NSMutableDictionary *)cell_data_dict{
    if (!_cell_data_dict) {
        _cell_data_dict = [NSMutableDictionary dictionary];
        NSArray *defaultArray = @[@"JDLHomeScrollviewCell"
//                                  @"YBLHomeButtonsCell",
//                                  @"YBLExpressNewsCell"
                                  ];
        NSMutableArray *sectionModel = @[].mutableCopy;
        for (NSString *cellname in defaultArray) {
            JDLListCellItemModel *cellItemModel = [JDLListCellItemModel new];
            cellItemModel.identifierOfRowItemCell = cellname;
            [sectionModel addObject:cellItemModel];
        }
        JDLListBaseModel *listItemModel = [JDLListBaseModel new];
        listItemModel.identifierOfSectionCellItemArray = sectionModel;
        [_cell_data_dict setObject:listItemModel forKey:@(0)];
        
    }
//    WMLog(@"啊啊啊啊===%@",_cell_data_dict);
    return _cell_data_dict;
}



-(RACSignal *)floorSignal{
    
    RACReplaySubject *subject =[RACReplaySubject subject];
    
    [JDLRequestTools HTTPSGetDataWithUrl:url_floors Parames:nil complete:^(id result, NSInteger statusCode) {
        
        //轮番图
        NSArray *adsArray = [JDLHomeScrollModel arrayOfModelsFromDictionaries:result[@"ads"] error:nil];
        [self resetAdsArray:adsArray];
        [subject sendNext:@(0)];
        
        
    } failure:^(NSError *error, NSInteger statusCode) {
        [subject sendError:error];
    }];
    return subject;
}
#pragma mark 轮番图
-(void)resetAdsArray:(NSArray *)adsArray{
    
    [self resetAdsBannerPurchasePushWithIndex:0 data:adsArray];
}

- (void)resetAdsBannerPurchasePushWithIndex:(NSInteger)index data:(NSArray *)data{
    
    JDLListBaseModel *listItemModel = self.cell_data_dict[@(0)];
    JDLListCellItemModel *CellItemModel = listItemModel.identifierOfSectionCellItemArray[index];
    CellItemModel.orginValueOfRowItemCellData = data.mutableCopy;
    if (!CellItemModel.valueOfRowItemCellData) {
        CellItemModel.valueOfRowItemCellData = [NSMutableArray array];
    }
    if ([CellItemModel.valueOfRowItemCellData count]>0) {
        [CellItemModel.valueOfRowItemCellData removeAllObjects];
    }
    CellItemModel.orginValueOfRowItemCellData = data.mutableCopy;
    for (id model in data) {
        if ([model isKindOfClass:[JDLHomeScrollModel class]]) {
            JDLHomeScrollModel *adsModel = (JDLHomeScrollModel *)model;
            [CellItemModel.valueOfRowItemCellData addObject:adsModel.pic_path];
        }
//        else if ([model isKindOfClass:[YBLPushPurchaseInfoModel class]]) {
//            YBLPushPurchaseInfoModel *pushPurchaseModel = (YBLPushPurchaseInfoModel *)model;
//            [CellItemModel.valueOfRowItemCellData addObject:pushPurchaseModel.message];
//        }
    }
}






@end
