//
//  JDLUserManagerCenetr.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/30.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLUserManagerCenetr : NSObject

+(instancetype)shareInstance;

///NetWork Status
@property (nonatomic, assign) BOOL             isNoActiveNetStatus;

@end
