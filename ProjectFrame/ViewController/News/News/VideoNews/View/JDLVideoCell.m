//
//  JDLVideoCell.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/12.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLVideoCell.h"

@interface JDLVideoCell()

@property (nonatomic,strong)WMPlayer *dragPlayerView;

@end

@implementation JDLVideoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    JDLVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JDLVideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //图片
        UIImageView *imageview = [[UIImageView alloc]init];
        [self.contentView addSubview:imageview];
        self.imageview = imageview;
        
        //题目背景
        UIImageView *imgBgTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
        imgBgTop.image = [UIImage imageNamed:@"top_shadow.png"];
        [self.contentView addSubview:imgBgTop];
        
        //题目
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.numberOfLines = 0;
        titleLabel.textColor = HEXColor(@"ffffff");
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIImageView *playcoverImage = [[UIImageView alloc]init];
        [self.contentView addSubview:playcoverImage];
        self.playcoverImage = playcoverImage;
        
        //时长
        UILabel *lengthLabel = [[UILabel alloc]init];
        lengthLabel.textColor = HEXColor(@"ffffff");
        lengthLabel.backgroundColor = KRGBAllColor(1, 1, 1, 0.3);
        lengthLabel.textAlignment = NSTextAlignmentCenter;
        lengthLabel.layer.cornerRadius = 10;
        lengthLabel.layer.masksToBounds = YES;
        lengthLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:lengthLabel];
        self.lengthLabel = lengthLabel;
        
        //来源图标
        UIImageView *playImage = [[UIImageView alloc] init];
        playImage.layer.cornerRadius = 12;
        playImage.layer.masksToBounds = YES;
        [self.contentView addSubview:playImage];
        self.playImage = playImage;
        
        //来源文字
        UILabel *lbSource = [[UILabel alloc] init];
        lbSource.font = [UIFont systemFontOfSize:13];
        lbSource.textColor = HEXColor(@"333333");
        [self.contentView addSubview:lbSource];
        self.playcountLabel = lbSource;
        
        //时间
        UILabel *ptimeLabel = [[UILabel alloc]init];
        ptimeLabel.textColor = HEXColor(@"797979");
        ptimeLabel.font = [UIFont systemFontOfSize:13];
        ptimeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:ptimeLabel];
        self.ptimeLabel = ptimeLabel;
        
        UIView *lineV = [[UIView alloc]init];
        lineV.backgroundColor = KRGBAllColor(239, 239, 244, 1);
        [self.contentView addSubview:lineV];
        self.lineV = lineV;
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

-(void)setModel:(JDLVideoFrame *)model{
    
    _model = model;
    JDLVideoModel *videodata = _model.videodata;
    
    //图片
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:videodata.cover] placeholderImage:[UIImage imageNamed:@"sc_video_play_fs_loading_bg.png"]];
    self.imageview.frame = _model.coverF;
    
    //题目
    NSString *str = [videodata.title stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    self.titleLabel.text = str;
    self.titleLabel.frame = _model.titleF;
    
    self.playcoverImage.image = [UIImage imageNamed:@"play_btn"];
    self.playcoverImage.frame = _model.playF;
    
    self.lengthLabel.text = [self convertTime:videodata.length];
    self.lengthLabel.frame = _model.lengthF;
    
    [self.playImage sd_setImageWithURL:[NSURL URLWithString:videodata.topicImg]];
    self.playImage.frame = _model.playImageF;
    
    self.playcountLabel.text = videodata.topicName;
    self.playcountLabel.frame = _model.playCountF;
    
    //时间
    self.ptimeLabel.text = videodata.ptime;
    self.ptimeLabel.frame = _model.ptimeF;
    
    self.lineV.frame = _model.lineVF;
}

//时间转换
- (NSString *)convertTime:(CGFloat)second{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    if (second/3600 >= 1) {
        [fmt setDateFormat:@"HH:mm:ss"];
    } else {
        [fmt setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [fmt stringFromDate:d];
    return showtimeNew;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
