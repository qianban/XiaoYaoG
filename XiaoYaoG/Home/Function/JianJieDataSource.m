//
//  JianJieDataSource.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/19.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "JianJieDataSource.h"
#import "XiaoYaoGJianJieCell.h"

@implementation JianJieDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        XiaoYaoGJianJieCell *xjc = [[XiaoYaoGJianJieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XiaoYaoGJianJieCell"];
        return xjc;
    }
    return [[UITableViewCell alloc]init];
}

@end
