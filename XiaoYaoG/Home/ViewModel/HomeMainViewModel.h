//
//  HomeMainViewModel.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/10.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HomeMainViewModel : NSObject

@property (nonatomic, copy) NSArray *modelArr;
@property (nonatomic, strong) NSArray *headerImages;

@property (nonatomic, strong) RACCommand *command;
@property (nonatomic, strong) RACSubject *subject;


@end
