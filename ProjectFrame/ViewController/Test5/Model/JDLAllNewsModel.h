//
//  JDLAllNewsModel.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JDLUserMessageModel.h"

@interface JDLAllNewsModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *type;//audio image video gif text
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger up;
@property (nonatomic, assign) NSInteger down;
@property (nonatomic, assign) NSInteger forward;
@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *passtime;
@property (nonatomic, assign) NSInteger bookmark;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) JDLUserMessageModel *u;

/** video*/
@property (nonatomic, copy) NSString *video_height;
@property (nonatomic, copy) NSString *video_thumbnail;
@property (nonatomic, copy) NSString *video_download;
@property (nonatomic, copy) NSString *video_width;
@property (nonatomic, copy) NSString *video_video;
@property (nonatomic, copy) NSString *video_duration;
@property (nonatomic, copy) NSString *video_playcount;

/** gif*/
@property (nonatomic, copy) NSString *gif_images;
@property (nonatomic, copy) NSString *gif_gif_thumbnail;
@property (nonatomic, copy) NSString *gif_download_url;
@property (nonatomic, copy) NSString *gif_width;
@property (nonatomic, copy) NSString *gif_height;


/** image*/
@property (nonatomic, copy) NSString *image_height;
@property (nonatomic, copy) NSString *image_width;
@property (nonatomic, copy) NSString *image_download_url;
@property (nonatomic, copy) NSString *image_thumbnail_small;
@property (nonatomic, copy) NSString *image_big;


@property (nonatomic,assign,getter=isUpSelected) BOOL upSelected;
@property (nonatomic,assign,getter=isDownSelected) BOOL downSelected;












@end
