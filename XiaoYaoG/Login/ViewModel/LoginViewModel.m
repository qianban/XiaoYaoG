//
//  LoginViewModel.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/28.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel()

@property (nonatomic, copy) NSString *action;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, copy) NSString *title;

@end

@implementation LoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self setupViewModel];
    }
    return self;
}

- (RACSubject *)subject {
    if (!_subject) {
        _subject = [RACSubject subject];
    }
    return _subject;
}

- (void)setupViewModel {
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSDictionary *dict = [self dictionaryWithType:[input integerValue]];
        return [NetSignal signalWithPostDictionary:dict];
    }];
    
    [self.command.executionSignals.switchToLatest subscribeNext:^(NSDictionary *x) {
        if ([x.allKeys.lastObject isEqualToString:@"success"]) {
            NSString *message = [NSString stringWithFormat:@"%@成功",self.title];
            [SVProgressHUD showSuccessWithStatus:message];
            [SVProgressHUD dismissWithDelay:1 completion:^{
                
            }];
        }else {
            NSString *message = [NSString stringWithFormat:@"%@失败",self.title];
            [SVProgressHUD showErrorWithStatus:message];
            [SVProgressHUD dismissWithDelay:1 completion:^{
                [self.subject sendNext:x];
            }];
        }
    }];
    
    [[self.command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            [SVProgressHUD showWithStatus:@"正在登录中"];
        }
    }];
}

- (NSDictionary *)dictionaryWithType:(NSInteger)type {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    switch (type) {
        case 0:
        {
            self.title = @"登录";
            [dict setValue:@"login" forKey:@"action"];
            [dict setValue:@{@"username":self.username,@"password":self.password} forKey:@"parameters"];
        }
            break;
        case 1:
        {
            self.title = @"注册";
            [dict setValue:@"login" forKey:@"action"];
            [dict setValue:@{@"username":self.username,@"password":self.password} forKey:@"parameters"];
//            [dict setValue:@"register" forKey:@"action"];
//            [dict setValue:@{@"username":self.username,@"password":self.password,@"repassword":self.repassword} forKey:@"parameters"];
        }
            break;
        case 2:
        {
            self.title = @"找回";
            [dict setValue:@"login" forKey:@"action"];
            [dict setValue:@{@"username":self.username,@"password":@"sdfsdfsdf"} forKey:@"parameters"];
        }
            break;

        default:
            break;
    }
    return dict;
}


@end
