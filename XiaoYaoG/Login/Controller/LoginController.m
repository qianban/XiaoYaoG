//
//  LoginController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/26.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "LoginController.h"
#import "LoginViewModel.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBT;

@property (nonatomic, strong) LoginViewModel *loginViewModel;

@end

@implementation LoginController

- (LoginViewModel *)loginViewModel {
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loginButtonEnable];
    [self loginButtonAction];
}

- (void)loginButtonEnable {
    RAC(self.loginViewModel, username) = _usernameTF.rac_textSignal;
    RAC(self.loginViewModel, password) = _passwordTF.rac_textSignal;
    RACSignal *enableSignal = [RACSignal combineLatest:@[_usernameTF.rac_textSignal, _passwordTF.rac_textSignal] reduce:^id(NSString *username, NSString *password){
        return @(username.length>3&&password.length>6);
         }];
    RAC(_loginBT, enabled) = enableSignal;
}

- (void)loginButtonAction {
    [[[_loginBT rac_signalForControlEvents:UIControlEventTouchUpInside]
     doNext:^(id x) {
         [self.view endEditing:YES];
     }]
     subscribeNext:^(id x) {
        [self.loginViewModel.command execute:@0];
    }];
    [self.loginViewModel.subject subscribeNext:^(id x) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
//        [self performSegueWithIdentifier:@"newSB" sender:self];
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
