//
//  JDLVideoView.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/18.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDLAllNewsModel.h"

@interface JDLVideoView : UIView

@property(nonatomic,strong)JDLAllNewsModel *allNewsModel;

@property (nonatomic , strong) BaseImageView *  placeHolderImage;    //
@property (nonatomic , strong) BaseLabel *      playCount;
@property (nonatomic , strong) BaseLabel *      allTime;
@property (nonatomic , strong) UIButton *     playButton;

@end
