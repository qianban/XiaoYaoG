//
//  SourceMainController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/16.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "SourceMainController.h"
#import "SourceMainDataSource.h"

@interface SourceMainController ()

@property (nonatomic, strong) SourceMainDataSource *sourceDataSource;

@end

@implementation SourceMainController

- (SourceMainDataSource *)sourceDataSource {
    if (!_sourceDataSource) {
        _sourceDataSource = [[SourceMainDataSource alloc] init];
    }
    return _sourceDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureSetup];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self reloadData];
}

- (void)configureSetup {
    
//    self.dataSource = self.sourceDataSource;
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
