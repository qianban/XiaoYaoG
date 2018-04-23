//
//  HomeMainDataSource.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/4/12.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "HomeMainDataSource.h"
#import "HomeMainCell.h"
#import "HomeMainModel.h"
#import "HomeItemModel.h"
#import "HomeCollectionCell.h"

@interface HomeMainDataSource()


@end

@implementation HomeMainDataSource

-(NSArray *)items {
    if (!_items) {
        HomeItemModel *model0 = [[HomeItemModel alloc] init];
        model0.title = @"箫遥阁";
        model0.image = [UIImage imageNamed:@"jianjie"];
        HomeItemModel *model1 = [[HomeItemModel alloc] init];
        model1.title = @"箫遥学箫";
        model1.image = [UIImage imageNamed:@"xuexiao"];
        HomeItemModel *model2 = [[HomeItemModel alloc] init];
        model2.title = @"箫遥主页";
        model2.image = [UIImage imageNamed:@"zhuye"];
        _items = @[model0,model1,model2];
//        _items = @[model0];
    }
    return _items;
}

#pragma mark -- tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DLog(@"%@",self.dataArray);
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeMainCell" forIndexPath:indexPath];
    HomeMainModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = model.title;
    cell.detailLabel.text = model.detail;
    cell.leadImageView.image = model.image;
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"最新动态";
}

#pragma mark -- collectionView dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionCell" forIndexPath:indexPath];
    HomeItemModel *model = self.items[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.leadImageView.image = model.image;
    return cell;
}














@end
