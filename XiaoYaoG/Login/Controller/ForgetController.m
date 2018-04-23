//
//  ForgetController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/8.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "ForgetController.h"
#import "LoginViewModel.h"

@interface ForgetController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UIButton *forgetBT;

@property (strong, nonatomic) LoginViewModel *forgetViewModel;

@end

@implementation ForgetController

- (LoginViewModel *)forgetViewModel {
    if (!_forgetViewModel) {
        _forgetViewModel = [[LoginViewModel alloc] init];
    }
    return _forgetViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setForgetEnable];
    [self forgetButtonAction];
}

- (void)setForgetEnable {
    RAC(self.forgetViewModel, username) = _usernameTF.rac_textSignal;
    RAC(self.forgetBT, enabled) = [_usernameTF.rac_textSignal map:^id(NSString *value) {
        return @(value.length >3);
    }];
}

- (void)forgetButtonAction {
    @weakify(self);
    [[[_forgetBT rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          @strongify(self);
          [self.view endEditing:YES];
      }] subscribeNext:^(id x) {
          @strongify(self);
          [self.forgetViewModel.command execute:@2];
      }];
    [self.forgetViewModel.subject subscribeNext:^(id x) {
        DLog(@"%@",x);
        [self.navigationController popViewControllerAnimated:YES];
    }];
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
