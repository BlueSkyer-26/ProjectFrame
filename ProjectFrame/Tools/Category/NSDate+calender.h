//
//  NSDate+calender.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/17.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (calender)

- (NSDateComponents *)deltaFrom:(NSDate *)from;
- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterday;

@end
