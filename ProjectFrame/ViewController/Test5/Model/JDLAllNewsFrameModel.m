//
//  JDLAllNewsFrameModel.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/18.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLAllNewsFrameModel.h"

@implementation JDLAllNewsFrameModel

-(void)setAllNewsModel:(JDLAllNewsModel *)allNewsModel{
    
    _allNewsModel =allNewsModel;
    
    _headImageview =CGRectMake(KNormalSpace, KNormalSpace *0.8, KAdaptX(36), KAdaptX(36));
    
    _vipImage =CGRectMake(KRight(_headImageview) -13 ,KBottom(_headImageview) -16 ,16,16);
    
    _titleLabel =CGRectMake(KRight(_headImageview) +KNormalSpace, KNormalSpace*0.8, KScreenWidth -2 *KRight(_headImageview) -KNormalSpace, KSCALE_WIDTH*20);
    
    _timeLabel =CGRectMake(KRight(_headImageview) +KNormalSpace, KBottom(_titleLabel), KScreenWidth -2 *KRight(_headImageview) -KNormalSpace, KSCALE_WIDTH*16);

    _moreBtn =CGRectMake(KScreenWidth -KAdaptX(55),KCenterY(_headImageview) -KAdaptX(36)*0.5, KAdaptX(55), KAdaptX(36));

    _contentLabel =CGRectMake(KNormalSpace, KBottom(_moreBtn) +KNormalSpace, KScreenWidth -2*KNormalSpace, [JDLTimeUpdate autoHeightLabelSize:CGSizeMake(KScreenWidth -20, 0) font:KAdaptX(13) text:allNewsModel.text]);

//    _openBtn =
    
    
    if ([allNewsModel.type isEqualToString:@"video"]) {
        CGFloat scale =[allNewsModel.video_height floatValue]/[allNewsModel.video_width floatValue];
        NSString *playCount;
        NSString *allTime;
        if ([allNewsModel.video_playcount integerValue] >= 10000) {
            playCount = [NSString stringWithFormat:@"%.1f万次播放", [allNewsModel.video_playcount integerValue] / 10000.0];
        } else {
            playCount = [NSString stringWithFormat:@"%zd次播放", [allNewsModel.video_playcount integerValue]];
        }
        allTime = [NSString stringWithFormat:@"%02zd:%02zd", [allNewsModel.video_duration integerValue] / 60,  [allNewsModel.video_duration integerValue] % 60];
        _mediaFrmae =CGRectMake(KNormalSpace, KBottom(_contentLabel), KScreenWidth -20, scale *(KScreenWidth -20));
        _placeHolderImage =CGRectMake(0, 0, KWidth(_mediaFrmae), KHeight(_mediaFrmae));
        _playCount =CGRectMake(5, KHeight(_mediaFrmae) -25, [JDLTimeUpdate autoWidthLabelSize:CGSizeMake(0, kStatusHeight) font:KAdaptX(12) text:playCount], kStatusHeight);
        _allTime =CGRectMake(KWidth(_mediaFrmae) -[JDLTimeUpdate autoWidthLabelSize:CGSizeMake(0, kStatusHeight) font:KAdaptX(12) text:allTime] -5, KHeight(_mediaFrmae) -25, [JDLTimeUpdate autoWidthLabelSize:CGSizeMake(0, kStatusHeight) font:KAdaptX(12) text:allTime], kStatusHeight);
        _playButton =CGRectMake(KCenterX(_placeHolderImage) -40, KCenterY(_placeHolderImage) -40, 80, 80);
    }else if ([allNewsModel.type isEqualToString:@"gif"]){
        CGFloat scale =[allNewsModel.gif_height floatValue]/[allNewsModel.gif_width floatValue];
        CGFloat imageRealHeight =scale *(KScreenWidth -20);
        _mediaFrmae =CGRectMake(KNormalSpace, KBottom(_contentLabel), KScreenWidth -20, imageRealHeight);
        _imageOrGifImage =CGRectMake(0, 0, KWidth(_mediaFrmae), KHeight(_mediaFrmae));
        
    }else if ([allNewsModel.type isEqualToString:@"image"]){
        CGFloat scale =[allNewsModel.image_height floatValue]/[allNewsModel.image_width floatValue];
        CGFloat imageRealHeight =scale *(KScreenWidth -20);
        CGFloat imageHeight;
        WMLog(@"高度====%f",imageRealHeight);
        imageHeight = imageRealHeight >KScreenHeight ? 100:imageRealHeight;
        _mediaFrmae =CGRectMake(KNormalSpace, KBottom(_contentLabel), KScreenWidth -20, imageHeight);
        _imageOrGifImage =CGRectMake(0, 0, KWidth(_mediaFrmae), KHeight(_mediaFrmae));
    }else{
        _mediaFrmae =CGRectMake(KNormalSpace, KBottom(_contentLabel), 0, 0);
    }
    
    
    _bottomMenuView =CGRectMake(0, KBottom(_mediaFrmae) +KNormalSpace, KScreenWidth, 30);

    _cellH =KBottom(_bottomMenuView);
}

@end
