//
//  JDLAllNewsFrameModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/18.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JDLAllNewsModel.h"

@interface JDLAllNewsFrameModel : NSObject

@property (nonatomic , strong)JDLAllNewsModel *allNewsModel;

/**
 *  头像
 */
@property (nonatomic , assign) CGRect headImageview;
/**
 *  vip
 */
@property (nonatomic , assign) CGRect vipImage;
/**
 *  昵称
 */
@property (nonatomic , assign) CGRect titleLabel;
/**
 *  时间
 */
@property (nonatomic , assign) CGRect timeLabel;
/**
 *  更多按钮
 */
@property (nonatomic , assign) CGRect moreBtn;
/**
 *  内容
 */
@property (nonatomic , assign) CGRect contentLabel;
/**
 *  展开btn
 */
@property (nonatomic , assign) CGRect openBtn;
/**
 *  bottomMenuView
 */
@property (nonatomic , assign) CGRect bottomMenuView;
/**
 *  mediaFrmae    各个媒体的frame
 */
@property (nonatomic , assign) CGRect mediaFrmae;

//视频控件frame
@property (nonatomic , assign) CGRect placeHolderImage;
@property (nonatomic , assign) CGRect playCount;
@property (nonatomic , assign) CGRect allTime;
@property (nonatomic , assign) CGRect playButton;

//视频控件frame
@property (nonatomic , assign) CGRect imageOrGifImage;
//@property (nonatomic , assign) CGRect playCount;
//@property (nonatomic , assign) CGRect allTime;
//@property (nonatomic , assign) CGRect playButton;


@property (nonatomic , assign) CGFloat cellH;




















@end
