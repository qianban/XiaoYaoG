//
//  HomeMainDataSource.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/12.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeMainDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *items;

@end
