//
//  NetSignal.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/8.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetSignal : NSObject

+ (RACSignal *)signalWithPostDictionary:(NSDictionary *)dictionary;
+ (RACSignal *)signalWithGetDictionary:(NSDictionary *)dictionary;

@end
