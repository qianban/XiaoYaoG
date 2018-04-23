//
//  HomeMainViewModel.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/10.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "HomeMainViewModel.h"

typedef void(^Complete)(BOOL isFull);

@interface HomeMainViewModel()

@property (nonatomic, copy) Complete complete;
@property (nonatomic, assign) BOOL direction;

@end

@implementation HomeMainViewModel

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
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"login" forKey:@"action"];
    [dict setValue:@{@"username":@"sssssss",@"password":@"aaaaaaa"} forKey:@"parameters"];
    self.headerImages = @[@"006",@"007",@"008",@"009",@"011"];
    RACSignal *headerSignal = [NetSignal signalWithGetDictionary:dict];
    RACSignal *cellSignal = [NetSignal signalWithGetDictionary:dict];
    RACSignal *zipSignal = [headerSignal zipWith:cellSignal];
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        DLog(@"%@",input);
        if ([input isKindOfClass:[RACTuple class]]) {
            self.direction = ((RACTuple *)input)[0];
            self.complete = ((RACTuple *)input)[1];
            return cellSignal;
        }
        return zipSignal;
    }];

    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        DLog(@"%@",x);
        DLog(@"%@",NSStringFromClass([x class]));
        [SVProgressHUD dismissWithDelay:1 completion:^{
            if ([x isKindOfClass:[RACTuple class]]) {

            } else if ([x isKindOfClass:[NSDictionary class]]) {
                self.complete(YES);
            }
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
