//
//  RegisterController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/2.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "RegisterController.h"
#import "LoginViewModel.h"

@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *repasswordTF;
@property (weak, nonatomic) IBOutlet UIButton *registerBT;

@property (strong, nonatomic) LoginViewModel *registerViewModel;

@end

@implementation RegisterController

- (LoginViewModel *)registerViewModel {
    if (!_registerViewModel) {
        _registerViewModel = [[LoginViewModel alloc] init];
    }
    return _registerViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setRegisterEnable];
    [self registerButtonAction];
}

- (void)setRegisterEnable {
    RAC(self.registerViewModel, username) = _usernameTF.rac_textSignal;
    RAC(self.registerViewModel, password) = _passwordTF.rac_textSignal;
    RAC(self.registerViewModel, repassword) = _repasswordTF.rac_textSignal;
    
    RACSignal *enableSignal = [RACSignal combineLatest:@[_usernameTF.rac_textSignal,_passwordTF.rac_textSignal,_repasswordTF.rac_textSignal] reduce:^id(NSString *username, NSString *password, NSString *repassword){
        return @([password isEqualToString:repassword]&&username.length>3&&password.length>6);
    }];
    RAC(_registerBT, enabled) = enableSignal;
}

- (void)registerButtonAction {
    [[[_registerBT rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          [self.view endEditing:YES];
      }]
     subscribeNext:^(id x) {
         [self.registerViewModel.command execute:@1];
     }];
    [self.registerViewModel.subject subscribeNext:^(id x) {
        [self.navigationController popViewControllerAnimated:YES];
//        [self performSegueWithIdentifier:@"antherSB" sender:self];
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
