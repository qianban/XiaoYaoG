//
//  AFHTTPTool.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/29.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPTool : NSObject

// get 请求
+ (void)requestGetWithAction:(NSString *)action params:(NSDictionary*)params
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError* error))failure;
// post 请求
+ (void)requestPostWithAction:(NSString *)action params:(NSDictionary*)params
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError* error))failure;

@end
