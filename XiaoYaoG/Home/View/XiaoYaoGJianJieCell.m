//
//  XiaoYaoGJianJieCell.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/19.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "XiaoYaoGJianJieCell.h"

@implementation XiaoYaoGJianJieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.briefLB.text = @"      箫遥阁洞箫艺术工作室。是武汉市第一家从事洞箫艺术传播与推广的专业机构。工作室立足于传统文化的传承，以发扬洞箫艺术为宗旨，让更多的人在享受中国传统艺术无穷魅力的同时，感受与汲取古人的智慧，将之融于现代的学习、工作与生活，用豁达与睿智开启不凡人生。\n\n      工作室成立于2012年，在创办者孙红明（残翼）先生的带领下，在诸多同好的共同努力之下，现已成为一个极具特色的洞箫艺术传播推广的专业平台。\n";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
