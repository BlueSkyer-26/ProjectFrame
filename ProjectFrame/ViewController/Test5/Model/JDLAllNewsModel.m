//
//  JDLAllNewsModel.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLAllNewsModel.h"

@implementation JDLAllNewsModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{

    return @{
        @"ID" : @"id",
        
        @"video_height" : @"video.height",
        @"video_thumbnail" : @"video.thumbnail[0]",
        @"video_download" : @"video.download[0]",
        @"video_width" : @"video.width",
        @"video_video" : @"video.video[0]",
        @"video_duration" : @"video.duration",
        @"video_playcount" : @"video.playcount",
        
        @"gif_images" : @"gif.images[0]",
        @"gif_gif_thumbnail" : @"gif.gif_thumbnail[0]",
        @"gif_download_url" : @"gif.download_url[0]",
        @"gif_width" : @"gif.width",
        @"gif_height" : @"gif.height",
        
        @"image_download_url" : @"image.download_url[0]",
        @"image_big" : @"image.big[0]",
        @"image_height" : @"image.height",
        @"image_width" : @"image.width",
        @"image_thumbnail_small" : @"image.thumbnail_small[0]",
        
    };
}

@end
