//
//  LoginViewModel.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/28.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *repassword;//注册流程使用

@property (nonatomic, strong) RACCommand *command;
@property (nonatomic, strong) RACSubject *subject;


@end
