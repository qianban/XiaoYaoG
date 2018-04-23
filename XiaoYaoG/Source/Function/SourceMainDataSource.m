//
//  SourceMainDataSource.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/13.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "SourceMainDataSource.h"
#import "JasSetController.h"
#import "LectureController.h"
#import "ConcertController.h"
#import "LandscapeController.h"

@implementation SourceMainDataSource

- (NSInteger)numberOfViewControllers {
    return 4;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    UIStoryboard *SB = [UIStoryboard storyboardWithName:@"Source" bundle:[NSBundle mainBundle]];
    switch (index) {
        case 0:
        {
            JasSetController *jasSet = [SB instantiateViewControllerWithIdentifier:@"JasSetController"];
            return jasSet;
        }
            break;
        case 1:
        {
            LectureController *lecture = [SB instantiateViewControllerWithIdentifier:@"LectureController"];
            return lecture;
        }
            break;
        case 2:
        {
            ConcertController *concert = [SB instantiateViewControllerWithIdentifier:@"ConcertController"];
            return concert;
        }
            break;
        case 3:
        {
            LandscapeController *landscape = [SB instantiateViewControllerWithIdentifier:@"LandscapeController"];
            return landscape;
        }
            break;

        default:
            break;
    }
    return [[UIViewController alloc] init];
}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            return @"雅集";
        }
            break;
        case 1:
        {
            return @"讲座";
        }
            break;
        case 2:
        {
            return @"音乐会";
        }
            break;
        case 3:
        {
            return @"山水清音";
        }
            break;

        default:
            break;
    }
    return @"";
}

- (CGFloat)tabHeight {
    return 40;
}
- (UIColor *)tabColor {
    return [UIColor orangeColor];
}
- (UIColor *)tabBackgroundColor {
    return [UIColor whiteColor];
}
- (UIFont *)titleFont {
    return [UIFont systemFontOfSize:17];
}
- (UIColor *)titleColor {
    return [UIColor blueColor];
}
- (CGFloat)bottomLineHeight {
    return 1;
}

@end
