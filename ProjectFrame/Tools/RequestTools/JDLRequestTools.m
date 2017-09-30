//
//  JDLRequestTools.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/29.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLRequestTools.h"

#import "JDLJSONResponseSerializer.h"

static const NSTimeInterval timeout =30;

@interface JDLRequestTools()

@end

@implementation JDLRequestTools

+(void)HTTPSGetDataWithUrl:(NSString *)url
                   Parames:(NSMutableDictionary *)parames
                  complete:(completeBlock)completeBlock
                   failure:(failureBlock)failureBlock{
    
    [self requestWithType:RequestTypeGet url:url parames:parames complete:^(id result, NSInteger statusCode) {
        completeBlock(result,statusCode);
    } failure:^(NSError *error, NSInteger statusCode) {
        failureBlock(error,statusCode);
    }];
}

+(void)HTTPSPOSTWithUrl:(NSString *)url
                Parames:(NSMutableDictionary *)parames
               complete:(completeBlock)completeBlock
                failure:(failureBlock)failureBlock{
    
    [self requestWithType:RequestTypePost url:url parames:parames complete:^(id result, NSInteger statusCode) {
        completeBlock(result,statusCode);
    } failure:^(NSError *error, NSInteger statusCode) {
        failureBlock(error,statusCode);
    }];
}

+(void)requestWithType:(RequestType)type
                   url:(NSString *)url
               parames:(NSMutableDictionary *)parames
              complete:(completeBlock)completeBlock
               failure:(failureBlock)failureBlock{
    
    BOOL vaild = [self checkRequestVaildWith:url];
    if (!vaild) {
        return;
    }
    WMLog(@"哈哈哈哈哈哈哈====url:%@\n parames:%@",url,parames);
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.requestSerializer.timeoutInterval = timeout;
    JDLJSONResponseSerializer *response = [JDLJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    manage.responseSerializer = response;
    
//    NSString *koen = [YBLUserManageCenter shareInstance].userModel.authentication_token;
//    [manage.requestSerializer setValue:koen forHTTPHeaderField:@"Authentication-Token"];
    [manage.requestSerializer setValue:XKey forHTTPHeaderField:@"X-Warehouse-Rest-Api-Key"];
    switch (type) {
        case RequestTypeGet:
        {
            [manage GET:url
             parameters:parames
               progress:nil
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    
                    NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
                    [self resetSuccess:responseObject code:responses.statusCode successHandler:completeBlock];
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    
                    [self resetError:error failureBlock:failureBlock];
                }];
            
        }
            break;
        case RequestTypePost:
        {
            [manage POST:url
              parameters:parames
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
                     NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
                     
                     [self resetSuccess:responseObject code:responses.statusCode successHandler:completeBlock];
                     
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
                     
                     [self resetError:error failureBlock:failureBlock];
                 }];
            
        }
            break;
//        case RequestTypeDELETE:
//        {
//            [manage DELETE:url
//                parameters:parames
//                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                       NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
//
//                       [self resetSuccess:responseObject code:responses.statusCode successHandler:block];
//
//                   }
//                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                       [self resetError:error failureBlock:fblock];
//
//                   }];
//        }
//            break;
//        case RequestTypePUT:
//        {
//            [manage PUT:url
//             parameters:parames
//                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                    NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
//
//                    [self resetSuccess:responseObject code:responses.statusCode successHandler:block];
//                }
//                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                    [self resetError:error failureBlock:fblock];
//
//                }];
//        }
//            break;
            
        default:
            break;
    }
}

+ (void)resetSuccess:(id)resp code:(NSInteger)code successHandler:(completeBlock)successHandler{
    
    WMLog(@"数据====code===%ld,responseObject:%@",(long)code,resp);
    if (code == 200||code==201||code==204) {
        successHandler(resp,code);
        
    } else {
        [SVProgressHUD showErrorWithStatus:RequsestErrorCodeTitle];
    }
}

+ (void)resetError:(NSError *)error failureBlock:(failureBlock)failureBlock{
    
    WMLog(@"错误====errorInfo:%@",error);
    [JDLLoadingView dismissInWindow];
    
    NSString *error_info = [error userInfo][Key_JsonBody];
    
    NSInteger error_code = [[error userInfo][Key_JsonStatusCode] integerValue];
    if (error_code==200||error_code==201) {
        return;
    }
    if (error_info) {
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error_info]];
    } else {
        [SVProgressHUD showErrorWithStatus:RequsestErrorTitle];
    }
    failureBlock(error,error_code);
}

+ (BOOL)checkRequestVaildWith:(NSString *)url{
    if (!url) {
        [SVProgressHUD showErrorWithStatus:@"URL不存在!"];
        [JDLLoadingView dismissInWindow];
        [SVProgressHUD dismiss];
        return NO;
    }
    NSString *kongString = @" ";
    if ([url rangeOfString:kongString].location!=NSNotFound) {
        [url stringByReplacingOccurrencesOfString:kongString withString:@""];
    }
    if ([JDLUserManagerCenetr shareInstance].isNoActiveNetStatus) {
        [JDLLoadingView dismissInWindow];
        [SVProgressHUD dismiss];
        return NO;
    }
    return YES;
}





@end
