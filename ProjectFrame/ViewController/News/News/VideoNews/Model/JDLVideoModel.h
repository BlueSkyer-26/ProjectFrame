//
//  JDLVideoModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/12.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLVideoModel : NSObject

/**
 *  题目
 */
@property (nonatomic , copy) NSString * title;
/**
 *  描述
 */
@property (nonatomic , copy) NSString * Description;
/**
 *  图片
 */
@property (nonatomic , copy) NSString * cover;
/**
 *  时长
 */
@property (nonatomic , assign) CGFloat length;
/**
 *  播放数
 */
@property (nonatomic , copy) NSString * playCount;
/**
 *  时间
 */
@property (nonatomic , copy) NSString * ptime;
/**
 *  视频地址
 */
@property (nonatomic , copy) NSString * mp4_url;
/**
 *  播放来源title
 */
@property (nonatomic , copy) NSString * topicName;
/**
 *  播放来源图片
 */
@property (nonatomic , copy) NSString * topicImg;




@end