//
//  JDLRequestTools.h
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/29.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,RequestType) {

    RequestTypeGet =0,
    RequestTypePost
};

@interface JDLRequestTools : NSObject

typedef void(^completeBlock)(id request,NSInteger statusCode);
typedef void(^failureBlock)(NSError *error,NSInteger statusCode);

/**
 *  GET 请求
 *
 *  @param url     url
 *  @param parames parames
 *  @param completeBlock   成功块
 *  @param failureBlock  失败块
 */
+(void)HTTPSGetDataWithUrl:(NSString *)url
                   Parames:(NSMutableDictionary *)parames
                  complete:(completeBlock)completeBlock
                   failure:(failureBlock)failureBlock;

/**
 *  POST 请求
 *
 *  @param url     url
 *  @param parames parames
 *  @param completeBlock   成功块
 *  @param failureBlock  失败块
 */
+(void)HTTPSPOSTWithUrl:(NSString *)url
                   Parames:(NSMutableDictionary *)parames
                  complete:(completeBlock)completeBlock
                   failure:(failureBlock)failureBlock;










@end
