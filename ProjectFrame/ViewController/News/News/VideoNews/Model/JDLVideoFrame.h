//
//  JDLVideoFrame.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/12.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JDLVideoModel.h"

@interface JDLVideoFrame : NSObject

@property (nonatomic , strong)JDLVideoModel *videodata;

/**
 *  题目
 */
@property (nonatomic , assign) CGRect titleF;
/**
 *  播放图标
 */
@property (nonatomic , assign) CGRect playF;
/**
 *  图片
 */
@property (nonatomic , assign) CGRect coverF;
/**
 *  时长
 */
@property (nonatomic , assign) CGRect lengthF;
/**
 *  播放来源图片
 */
@property (nonatomic , assign) CGRect playImageF;
/**
 *  播放来源文字
 */
@property (nonatomic , assign) CGRect playCountF;
/**
 *  时间
 */
@property (nonatomic , assign) CGRect ptimeF;

@property (nonatomic , assign) CGRect lineVF;

@property (nonatomic , assign) CGFloat cellH;

@end
