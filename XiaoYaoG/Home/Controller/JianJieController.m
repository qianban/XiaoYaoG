//
//  JianJieController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/19.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "JianJieController.h"

@interface JianJieController ()<UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;

@end

@implementation JianJieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 2 && indexPath.row == 2) {
//        return (SCREEN_WIDTH - 32)*213/320.0;
//    }
//    return 100;
//}

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
