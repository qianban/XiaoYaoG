//
//  Define.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/17.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#ifndef Define_h
#define Define_h

#ifdef DEBUG
#define NULLSAFE_ENABLED 0
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define BaseURL @"http://120.25.226.186:32812/"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#import "UITableView+RefreshData.h"
#import "AFHTTPTool.h"
#import "NetSignal.h"



#endif /* Define_h */
