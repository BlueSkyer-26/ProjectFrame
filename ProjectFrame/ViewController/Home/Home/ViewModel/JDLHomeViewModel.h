//
//  JDLHomeViewModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/29.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLHomeViewModel : NSObject

/*
 *  Home数据 Signal信号
 */
@property(nonatomic,strong)RACSignal             *floorSignal;

/*
 *  cell_data
 */
@property(nonatomic,strong)NSMutableDictionary   *cell_data_dict;


/*
 *
 */

/*
 *
 */

@end
