//
//  UICollectionViewCell+updateModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (updateModel)

-(void)updateItemCellModel:(id)itemModel;

+(CGFloat)getItemCellHeightWithModel:(id)itemModel;

@end
