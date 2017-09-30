//
//  JDLHomeUIService.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/28.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLBaseService.h"

@interface JDLHomeUIService : JDLBaseService

@property (nonatomic,strong)UICollectionView *homeCollectionView;

//首页tableview滚动的距离
@property (nonatomic,assign)CGFloat contentY;

-(void)requestHomeData;

-(void)startTimer;

-(void)stopTimer;

@end
