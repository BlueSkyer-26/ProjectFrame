//
//  JDLListBaseModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLListCellItemModel : NSObject

@property (nonatomic ,copy) NSString *identifierOfRowItemCell;

@property (nonatomic) id valueOfRowItemCellData;

@property (nonatomic) id orginValueOfRowItemCellData;

@end

/**
 *  section of list model
 */
@interface JDLListBaseModel : NSObject

@property (nonatomic ,strong)NSMutableArray <JDLListCellItemModel *> *identifierOfSectionCellItemArray;

@property (nonatomic) id valueOfSectionItemCellViewData;

@property (nonatomic, copy  ) NSString *identifyOfSectionItemHeaderView;

@property (nonatomic) id valueOfSectionItemHeaderViewData;

@property (nonatomic, copy  ) NSString *identifyOfSectionItemFooterView;

@property (nonatomic) id valueOfSectionItemFooterViewData;

@end
