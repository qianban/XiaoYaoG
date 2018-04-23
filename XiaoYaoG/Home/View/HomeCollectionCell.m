//
//  HomeCollectionCell.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/13.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "HomeCollectionCell.h"

@implementation HomeCollectionCell

- (void)setLeadImageView:(UIImageView *)leadImageView {
    _leadImageView = leadImageView;
    [_leadImageView zy_cornerRadiusRoundingRect];
}

@end
