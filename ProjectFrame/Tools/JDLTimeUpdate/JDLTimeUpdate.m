//
//  JDLTimeUpdate.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLTimeUpdate.h"

@implementation JDLTimeUpdate

//计算高度
+ (CGFloat)autoHeightLabelSize:(CGSize)size font:(CGFloat)font text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, CGFLOAT_MAX)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    [label sizeToFit];
    
    return label.frame.size.height;
}

//计算宽度
+ (CGFloat)autoWidthLabelSize:(CGSize)size font:(CGFloat)font text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, kStatusHeight)];
    label.numberOfLines = 1;
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    [label sizeToFit];
    
    return label.frame.size.width;
}

//切换时间
+(NSString *)updateTimeWithPassTime:(NSString *)passtime{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create = [fmt dateFromString:passtime];
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return passtime;
    }
}
@end
