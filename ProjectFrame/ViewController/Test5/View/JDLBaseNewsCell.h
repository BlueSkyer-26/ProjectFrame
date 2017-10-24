//
//  JDLBaseNewsCell.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "JDLAllNewsModel.h"
#import "JDLAllNewsFrameModel.h"

@interface JDLBaseNewsCell : UITableViewCell

@property(nonatomic,strong)JDLAllNewsFrameModel *frameModel;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end
