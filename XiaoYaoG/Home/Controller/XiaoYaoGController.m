//
//  MoreModuleController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/16.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "XiaoYaoGController.h"
#import "JianJieController.h"
#import "WangLuoController.h"
#import "XianXiaController.h"

#import "XiaoYaoGDataSource.h"

@interface XiaoYaoGController ()
@property (nonatomic, strong) XiaoYaoGDataSource *GDataSource;
@property (nonatomic, strong) NSArray *subControllers;

@end

@implementation XiaoYaoGController

- (XiaoYaoGDataSource *)GDataSource {
    if (!_GDataSource) {
        _GDataSource = [[XiaoYaoGDataSource alloc] init];
    }
    return _GDataSource;
}

- (NSArray *)subControllers {
    if (!_subControllers) {
        UIStoryboard *SB = [UIStoryboard storyboardWithName:@"XiaoYaoG" bundle:[NSBundle mainBundle]];
        JianJieController *jjc = [SB instantiateViewControllerWithIdentifier:@"JianJieController"];
        WangLuoController *wlc = [SB instantiateViewControllerWithIdentifier:@"WangLuoController"];
        XianXiaController *xxc = [SB instantiateViewControllerWithIdentifier:@"XianXiaController"];
        _subControllers = @[jjc,wlc,xxc];
    }
    return _subControllers;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view layoutIfNeeded];
    [self setDataSources];
    [self setRACObserves];
    [self setDelegateEvents];
    [self setDelegates];
    [self setUIUpdates];

}

- (void)setRACObserves {
    RAC(self.GDataSource, controllers) = RACObserve(self, subControllers);
    [RACObserve(self.GDataSource, controllers) subscribeNext:^(id x) {
        [self reloadData];
    }];
}

- (void)setDelegateEvents {
    
}

- (void)setDataSources {
    self.dataSource = self.GDataSource;
}

- (void)setDelegates {
    
}

- (void)setUIUpdates {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
