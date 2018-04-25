//
//  XianXiaViewModel.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/23.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "XianXiaViewModel.h"


@implementation XianXiaViewModel

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
    self.headerImages = @[@"first",@"second",@"third"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"login" forKey:@"action"];
    [dict setValue:@{@"username":@"sssssss",@"password":@"aaaaaaa"} forKey:@"parameters"];
    RACSignal *headerSignal = [NetSignal signalWithGetDictionary:dict];
    RACSignal *cellSignal = [NetSignal signalWithGetDictionary:dict];
    RACSignal *zipSignal = [headerSignal zipWith:cellSignal];
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        DLog(@"%@",input);
        return zipSignal;
    }];
    
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        DLog(@"%@",x);
        DLog(@"%@",NSStringFromClass([x class]));
        [SVProgressHUD dismissWithDelay:1 completion:^{
            [self.subject sendNext:x];
        }];
    }];
    
    [[self.command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            [SVProgressHUD showWithStatus:@"加载中..."];
        }
    }];
}

@end
