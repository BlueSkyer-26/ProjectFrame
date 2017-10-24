//
//  JDLGifOrPngView.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/18.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLGifOrPngView.h"

@implementation JDLGifOrPngView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [self setupUIWith:frame];
    }
    return  self;
}

-(void)setupUIWith:(CGRect)frame{
    
    self.imageOrGifImage =[JDLFactory imageViewWithImage:kImageName(@"imageBackground") frame:CGRectZero];
    self.imageOrGifImage.contentMode =UIViewContentModeScaleToFill;
    self.imageOrGifImage.userInteractionEnabled  =YES;
    [self addSubview:self.imageOrGifImage];
    
//    self.playCount =[JDLFactory labelWithText:@"0" frame:CGRectZero textFont:KSYSTEMFONT(KAdaptX(12)) textColor:KWhiteColor textAlignment:NSTextAlignmentLeft];
//    self.playCount.backgroundColor =KRGBAllColor(0, 0, 0, 0.3);
//    [self.placeHolderImage addSubview:self.playCount];
//    
//    self.allTime =[JDLFactory labelWithText:@"00:00" frame:CGRectZero textFont:KSYSTEMFONT(KAdaptX(12)) textColor:KWhiteColor textAlignment:NSTextAlignmentRight];
//    self.allTime.backgroundColor =KRGBAllColor(0, 0, 0, 0.3);
//    [self.placeHolderImage addSubview:self.allTime];
    
}

-(void)setAllNewsModel:(JDLAllNewsModel *)allNewsModel{
    
    _allNewsModel =allNewsModel;
    if ([allNewsModel.type isEqualToString:@"gif"]) {
        [self.imageOrGifImage sd_setImageWithURL:[NSURL URLWithString:allNewsModel.gif_images]];
    }else if ([allNewsModel.type isEqualToString:@"image"]){
        [self.imageOrGifImage sd_setImageWithURL:[NSURL URLWithString:allNewsModel.image_thumbnail_small]];
    }
    
    
    
    
    
    
    
}

@end
