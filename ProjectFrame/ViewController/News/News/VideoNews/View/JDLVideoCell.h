//
//  JDLVideoCell.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/12.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDLVideoFrame.h"

@interface JDLVideoCell : UITableViewCell

@property (nonatomic,strong)JDLVideoFrame *model;

@property (nonatomic , weak) UILabel *      titleLabel;
@property (nonatomic , weak) UIImageView *  imageview;
@property (nonatomic , weak) UIImageView *  playcoverImage;
@property (nonatomic , weak) UILabel *      lengthLabel;
@property (nonatomic , weak) UIImageView *  playImage;
@property (nonatomic , weak) UILabel *      playcountLabel;
@property (nonatomic , weak) UILabel *      ptimeLabel;
@property (nonatomic , weak) UIView *       lineV;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end
