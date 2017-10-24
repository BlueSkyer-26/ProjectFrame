//
//  JDLVideoView.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/18.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLVideoView.h"

#import "GYPlayer.h"
#import "WMPlayer.h"

@interface JDLVideoView()

@property (nonatomic,strong)GYPlayer *player;
@property (nonatomic,strong)WMPlayer *dragPlayerView;

@end

@implementation JDLVideoView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [self setupUIWith:frame];
    }
    return  self;
}

-(void)setupUIWith:(CGRect)frame{
    
    self.placeHolderImage =[JDLFactory imageViewWithImage:kImageName(@"imageBackground") frame:CGRectZero];
    self.placeHolderImage.contentMode =UIViewContentModeScaleAspectFill;
    self.placeHolderImage.userInteractionEnabled  =YES;
    [self addSubview:self.placeHolderImage];
    
    self.playCount =[JDLFactory labelWithText:@"0" frame:CGRectZero textFont:KSYSTEMFONT(KAdaptX(12)) textColor:KWhiteColor textAlignment:NSTextAlignmentLeft];
    self.playCount.backgroundColor =KRGBAllColor(0, 0, 0, 0.3);
    [self.placeHolderImage addSubview:self.playCount];
    
    self.allTime =[JDLFactory labelWithText:@"00:00" frame:CGRectZero textFont:KSYSTEMFONT(KAdaptX(12)) textColor:KWhiteColor textAlignment:NSTextAlignmentRight];
    self.allTime.backgroundColor =KRGBAllColor(0, 0, 0, 0.3);
    [self.placeHolderImage addSubview:self.allTime];
    
//    video-play
    self.playButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton setImage:kImageName(@"video-play") forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.placeHolderImage addSubview:self.playButton];
}

-(void)playVideo{
    
    if (self.dragPlayerView) {
        [self.dragPlayerView resetWMPlayer];
        self.dragPlayerView = nil;
    }

    self.dragPlayerView = [[WMPlayer alloc] initWithFrame:self.bounds];
    self.dragPlayerView.URLString = self.allNewsModel.video_download;
    [self addSubview:self.dragPlayerView];
    self.dragPlayerView.dragEnable =NO;
    self.dragPlayerView.closeBtn.hidden = YES;
    [self.dragPlayerView play];
    
    //创建播放器
//    if (self.player) {
//        [self.player removePlayer];
//        [self.player removeFromSuperview];
//        self.player = nil;
//    }
//    //    CGFloat originY = videoframe.cellH*indexPath.row+videoframe.coverF.origin.y+SCREEN_WIDTH * 0.25;
////    CGFloat originY = videoframe.cellH*indexPath.row;
////    self.currentOriginY = originY;
//    self.player = [[GYPlayer alloc] initWithFrame:self.bounds];
//    self.player.mp4_url = self.allNewsModel.video_download;
////    self.player.title = videodata.title;
////    self.player.currentOriginY = originY;
////    WEAKSELF;
////    self.player.currentRowBlock = ^(){
////        [weakSelf addSubview:weakSelf.player];
////    };
//    [self addSubview:self.player];
}

-(void)setAllNewsModel:(JDLAllNewsModel *)allNewsModel{
    
    _allNewsModel =allNewsModel;

    if ([allNewsModel.video_playcount integerValue] >= 10000) {
        self.playCount.text = [NSString stringWithFormat:@"%.1f万次播放", [allNewsModel.video_playcount integerValue] / 10000.0];
    } else {
        self.playCount.text = [NSString stringWithFormat:@"%zd次播放", [allNewsModel.video_playcount integerValue]];
    }
    self.allTime.text = [NSString stringWithFormat:@"%02zd:%02zd", [allNewsModel.video_duration integerValue] / 60,  [allNewsModel.video_duration integerValue] % 60];
    [self.placeHolderImage sd_setImageWithURL:[NSURL URLWithString:allNewsModel.video_thumbnail]];
}












@end
