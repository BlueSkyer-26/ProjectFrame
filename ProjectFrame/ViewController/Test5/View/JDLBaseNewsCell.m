//
//  JDLBaseNewsCell.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLBaseNewsCell.h"

#import "JDLVideoView.h"
#import "JDLGifOrPngView.h"

@interface JDLBaseNewsCell ()

@property (nonatomic , strong) NSMutableArray *  bottomBtnArray;    //按钮数组

@property (nonatomic , strong) BaseImageView *  headImageview;    //头像
@property (nonatomic , weak) UIImageView *  vipImage;          //vip
@property (nonatomic , weak) UILabel *      titleLabel;   //昵称
@property (nonatomic , weak) UILabel *      timeLabel;   //时间
@property (nonatomic , weak) UIButton *     moreBtn;      //更多

@property (nonatomic , weak) UILabel *      contentLabel;   //内容
@property (nonatomic , weak) UIButton *     openBtn;      //展开  闭合

@property (nonatomic , weak) UIView *           bottomMenuView;
@property (nonatomic , strong) BaseButton *     bottomBtn;      //

@property (nonatomic , strong) JDLVideoView *videoView;  //视频
@property (nonatomic , strong) JDLGifOrPngView *imageOrGifView;  //图片


@end

@implementation JDLBaseNewsCell

-(NSMutableArray *)bottomBtnArray{
    
    if (!_bottomBtnArray) {
        _bottomBtnArray =[NSMutableArray array];
    }
    return _bottomBtnArray;
}

//-(JDLVideoView *)videoView{
//
//    if (!_videoView) {
//        _videoView =[[JDLVideoView alloc] init];
//        [self.contentView addSubview:_videoView];
//    }
//    return  _videoView;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    JDLBaseNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JDLBaseNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //头像
        self.headImageview =[JDLFactory imageViewWithImage:nil frame:CGRectMake(KNormalSpace, KNormalSpace*0.8, KSCALE_WIDTH*36, KSCALE_WIDTH*36)];
        [self.headImageview imageViewWithCornerRadius:KSCALE_WIDTH*18];
        [self.contentView addSubview:self.headImageview];
        
        //vip
        UIImageView *vipImage = [[UIImageView alloc] init];
        vipImage.image =kImageName(@"Profile_AddV_authen");
        [self.contentView addSubview:vipImage];
        self.vipImage =vipImage;
        //昵称
        UILabel *titleLabel = [[UILabel alloc]init];
//        titleLabel.font = KSYSTEMFONT(KAdaptX(13));
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.numberOfLines = 0;
        titleLabel.textColor = KGray2Color;
        titleLabel.adjustsFontSizeToFitWidth =YES;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        //时间   
        UILabel *timeLabel = [[UILabel alloc]init];
//        timeLabel.font = KSYSTEMFONT(KAdaptX(16));
        timeLabel.textAlignment = NSTextAlignmentLeft;
        timeLabel.numberOfLines = 0;
        timeLabel.adjustsFontSizeToFitWidth =YES;
        timeLabel.textColor = KGray2Color;
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        //更多btn
        UIButton *moreBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        moreBtn.mj_x =KScreenWidth -KAdaptX(55);
        moreBtn.centerY =self.headImageview.centerY;
        [moreBtn setImage:kImageName(@"cellmorebtnnormal") forState:UIControlStateNormal];
        [self.contentView addSubview:moreBtn];
        self.moreBtn =moreBtn;
        
        //内容
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor =KWhiteColor;
        contentLabel.font = KSYSTEMFONT(KAdaptX(13));
        contentLabel.textColor = HEXColor(@"333333");
        contentLabel.numberOfLines =0;
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        //展开btn
        UIButton *openBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//        [openBtn setImage:kImageName(@"") forState:UIControlStateNormal];
        [openBtn setTitle:@"展开" forState:UIControlStateNormal];
        [self.contentView addSubview:openBtn];
        self.openBtn =openBtn;
        
        //video
        self.videoView =[[JDLVideoView alloc] init];
        self.videoView.backgroundColor =KClearColor;
        [self.contentView addSubview:self.videoView];
        
        //image or gif
        self.imageOrGifView =[[JDLGifOrPngView alloc] init];
        self.imageOrGifView.backgroundColor =KOrangeColor;
        [self.contentView addSubview:self.imageOrGifView];
        
        UIView *bottomMenuView = [[UIView alloc]init];
        bottomMenuView.frame =CGRectMake(0, KBottom(contentLabel.frame) +KNormalSpace, KScreenWidth, 30);
        bottomMenuView.backgroundColor = KWhiteColor;
        [self.contentView addSubview:bottomMenuView];
        self.bottomMenuView = bottomMenuView;
        
        self.bottomMenuView.layer.shadowPath =[self getShadowPath].CGPath;
        
        CGFloat btnWidth =bottomMenuView.width/4;
        NSArray *iconArray =@[@"timeline_icon_unlike",@"icon_unlike_normal",@"timeline_icon_retweet",@"timeline_icon_comment"];
        NSArray *itemArray =@[@"顶",@"踩",@"转发",@"评论"];
        for (int i =0; i <iconArray.count; i ++) {
            self.bottomBtn =[JDLFactory buttonWithTitle:itemArray[i] image:kImageName(iconArray[i]) frame:CGRectMake(i *btnWidth, 0, btnWidth, 30)];
            [self.bottomBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
            self.bottomBtn.tag =i;
            [self.bottomBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.bottomMenuView addSubview:self.bottomBtn];
            [self.bottomBtnArray addObject:self.bottomBtn];
            
            UILabel *line =[[UILabel alloc] initWithFrame:CGRectMake(btnWidth *(i+1), 7.5, 1, self.bottomMenuView.height -15)];
            line.backgroundColor =KGray2Color;
            [self.bottomMenuView addSubview:line];
        }
        
        
        self.backgroundColor = KWhiteColor;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
}

-(void)setFrameModel:(JDLAllNewsFrameModel *)frameModel{
    
    _frameModel =frameModel;
    JDLAllNewsModel *model =_frameModel.allNewsModel;
    
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString:model.u.header]];
//    [self.headImageview sd_setImageWithURL:[NSURL URLWithString:model.video_thumbnail]];
    self.headImageview.frame =frameModel.headImageview;
    
    self.vipImage.frame =frameModel.vipImage;
    
    self.titleLabel.text =model.u.name;
    self.titleLabel.frame =frameModel.titleLabel;
    
    self.timeLabel.text =[JDLTimeUpdate updateTimeWithPassTime:model.passtime];
    self.timeLabel.frame =frameModel.timeLabel;
    
    self.moreBtn.frame =frameModel.moreBtn;
    
    self.contentLabel.text =model.text;
    self.contentLabel.frame =frameModel.contentLabel;
    
    if ([model.type isEqualToString:@"video"]) {
        self.videoView.hidden =![model.type isEqualToString:@"video"];
        self.videoView.frame =frameModel.mediaFrmae;
        self.videoView.placeHolderImage.frame =frameModel.placeHolderImage;
        self.videoView.playCount.frame =frameModel.playCount;
        self.videoView.allTime.frame =frameModel.allTime;
        self.videoView.playButton.frame =frameModel.playButton;
        self.videoView.allNewsModel =model;
    }else if ([model.type isEqualToString:@"image"] || [model.type isEqualToString:@"gif"]){
        self.imageOrGifView.hidden =!([model.type isEqualToString:@"image"] ||[model.type isEqualToString:@"gif"]);
        self.imageOrGifView.frame =frameModel.mediaFrmae;
        self.imageOrGifView.imageOrGifImage.frame =frameModel.imageOrGifImage;
        self.imageOrGifView.allNewsModel =model;
    }
    
    self.bottomMenuView.frame =frameModel.bottomMenuView;
    
    NSMutableArray *bottomNumArray =[NSMutableArray array];
    [bottomNumArray addObject:kNSStringFormat(@"%ld",(long)model.up)];
    [bottomNumArray addObject:kNSStringFormat(@"%ld",(long)model.down)];
    [bottomNumArray addObject:kNSStringFormat(@"%ld",(long)model.forward)];
    [bottomNumArray addObject:kNSStringFormat(@"%ld",(long)model.comment)];
    NSArray *itemArray =@[@"顶",@"踩",@"转发",@"评论"];
    for (int i =0; i <bottomNumArray.count; i ++) {
        UIButton *btn =(UIButton *)_bottomBtnArray[i];
        [self bottomNumWith:btn num:bottomNumArray[i] placeHolderText:itemArray[i]];
        if (i ==0) {
            btn.selected =model.isUpSelected;
            [btn setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"timeline_icon_like"] forState:UIControlStateSelected];
        }else if (i ==1){
            btn.selected =model.isDownSelected;
            [btn setImage:[UIImage imageNamed:@"icon_unlike_normal"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"icon_unlike_h"] forState:UIControlStateSelected];
        }
    }
    
}

-(void)bottomBtnClick:(UIButton *)btn{
    JDLAllNewsModel *model =self.frameModel.allNewsModel;
    switch (btn.tag) {
        case 0:{
            WMLog(@"顶===%ld===%@",(long)model.up,model.ID);

            [btn setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"timeline_icon_like"] forState:UIControlStateSelected];
            [self addRotateAnimationOnView:btn.imageView];
            model.up += model.upSelected ? -1 : 1;
            model.upSelected = !model.upSelected;
            btn.selected = !btn.selected;
            
            [self bottomNumWith:btn num:kNSStringFormat(@"%ld",(long)model.up) placeHolderText:@"顶"];
            WMLog(@"顶222===%ld===%@",(long)model.up,model.ID);
        }
            break;
        case 1:{
            WMLog(@"踩===%ld===%@",(long)model.down,model.ID);
            [btn setImage:[UIImage imageNamed:@"icon_unlike_normal"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"icon_unlike_h"] forState:UIControlStateSelected];
            [self addRotateAnimationOnView:btn.imageView];
            
            model.down += model.downSelected ? -1 : 1;
            model.downSelected =!model.downSelected;
            btn.selected =!btn.selected;
            
            [self bottomNumWith:btn num:kNSStringFormat(@"%ld",(long)model.down) placeHolderText:@"踩"];
            WMLog(@"踩222===%ld===%@",(long)model.down,model.ID);
        }
            break;
        case 2:{
            WMLog(@"转发===%ld",(long)model.forward);
        }
            break;
        case 3:{
            WMLog(@"评论===%ld",(long)model.comment);
        }
            break;
            
        default:
            break;
    }
}

-(void)bottomNumWith:(UIButton *)button num:(NSString *)num placeHolderText:(NSString *)holder{
    
    NSInteger number =[num integerValue];
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    } else {
        [button setTitle:holder forState:UIControlStateNormal];
    }
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}

-(UIBezierPath *)getShadowPath{
    
    //添加阴影
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    self.layer.shadowOffset = CGSizeMake(0,0);
    self.layer.shadowRadius = 4;//阴影半径，默认3
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, self.height-1)];
    [path addLineToPoint:CGPointMake(self.width, self.height-1)];
    [path addLineToPoint:CGPointMake(self.width, self.height+2)];
    [path addLineToPoint:CGPointMake(0, self.height+2)];
    [path addLineToPoint:CGPointMake(0, self.height-1)];
    return path;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
