//
//  AFHTTPTool.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/29.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "AFHTTPTool.h"


@implementation AFHTTPTool


+ (void)requestGetWithAction:(NSString *)action params:(NSDictionary*)params
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError* error))failure {
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",BaseURL,action];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer.timeoutInterval = 30;
    [manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        DLog(@"downloadProgress:%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)requestPostWithAction:(NSString *)action params:(NSDictionary*)params
                      success:(void (^)(id response))success
                      failure:(void (^)(NSError* error))failure {
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",BaseURL,action];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer.timeoutInterval = 30;
    [manager POST:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        DLog(@"downloadProgress:%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
