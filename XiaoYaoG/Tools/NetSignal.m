//
//  NetSignal.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/8.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "NetSignal.h"

@implementation NetSignal

+ (RACSignal *)signalWithPostDictionary:(NSDictionary *)dictionary {
    NSString *action = [dictionary objectForKey:@"action"];
    NSDictionary *params = [dictionary objectForKey:@"parameters"];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [AFHTTPTool requestPostWithAction:action params:params success:^(id response) {
            [subscriber sendNext:response];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

+ (RACSignal *)signalWithGetDictionary:(NSDictionary *)dictionary {
    NSString *action = [dictionary objectForKey:@"action"];
    NSDictionary *params = [dictionary objectForKey:@"parameters"];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [AFHTTPTool requestGetWithAction:action params:params success:^(id response) {
            [subscriber sendNext:response];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}


@end
