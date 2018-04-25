//
//  XianXiaController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/19.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "XianXiaController.h"
#import "XianXiaViewModel.h"
#import "XianXiaDataSource.h"

@interface XianXiaController ()<SDCycleScrollViewDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeSeg;

@property (strong, nonatomic) XianXiaViewModel *viewModel;

@end

@implementation XianXiaController

- (XianXiaViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[XianXiaViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setControlDataSources];
    [self setRelationRACObserves];
    [self realizeDelegatesAndEvents];
    [self setControlDelegates];
    [self setOrUpdateUI];

}
- (void)setControlDataSources {
}

- (void)setRelationRACObserves {
    RAC(_cycleView,localizationImageNamesGroup) = RACObserve(self.viewModel, headerImages);
}

- (void)realizeDelegatesAndEvents {
    [[_changeSeg rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(NSNumber *x) {
        DLog(@"%@",x);
    }];
    [[self rac_signalForSelector:@selector(cycleScrollView:didSelectItemAtIndex:) fromProtocol:@protocol(SDCycleScrollViewDelegate)] subscribeNext:^(RACTuple *x) {
        DLog(@"%@",x);
        DLog(@"%@",x[0]);
        DLog(@"%@",x[1]);
    }];
}

- (void)setControlDelegates {
    _cycleView.delegate = self;
    self.tableView.delegate = self;
}

- (void)setOrUpdateUI {
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.5+30);
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
