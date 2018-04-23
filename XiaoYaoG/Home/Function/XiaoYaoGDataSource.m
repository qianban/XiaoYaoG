//
//  XiaoYaoGDataSource.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/19.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "XiaoYaoGDataSource.h"

@implementation XiaoYaoGDataSource

- (NSInteger)numberOfViewControllers {
    return [self.controllers count];
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    return [self.controllers objectAtIndex:index];
}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    UIViewController *vc = [self.controllers objectAtIndex:index];
    return vc.title;
}
- (CGFloat)tabHeight {
    return 40;
}
- (UIColor *)tabColor {
    return [UIColor colorWithRed:88/255.0 green:119/255.0 blue:1 alpha:1];
}
- (UIColor *)tabBackgroundColor {
    return [UIColor whiteColor];
}
- (UIFont *)titleFont {
    return [UIFont systemFontOfSize:15];
}
- (UIColor *)titleColor {
    return [UIColor brownColor];

}
- (CGFloat)bottomLineHeight {
    return 1;
}

@end
