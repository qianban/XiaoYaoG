//
//  UITableView+RefreshData.h
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/17.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import  <UIKit/UIKit.h>

@protocol  UITableViewRefreshDelegate;

//@protocol  UITableViewUploadDelegate;

@interface UITableView (RefreshData)

/**为方便操作与StoryBoard连线，将下拉刷新与上拉加载代理分开*/

@property (nonatomic, weak) IBOutlet id<UITableViewRefreshDelegate> freshDelegate;//下拉刷新的代理

@property (nonatomic, weak) IBOutlet id<UITableViewRefreshDelegate> uploadDelegate;// 上拉加载的代理

// 下拉刷新方法

- (void)beginRefresh;

// 上拉加载方法

- (void)beginUpload;

@end

@protocol UITableViewRefreshDelegate <NSObject>

@optional

- (void)dataRequestWithRefresh:(BOOL)isRefresh complete:(void(^)(BOOL isFulfill))complete;

@end

//@protocol UITableViewUploadDelegate <NSObject>
//
//@optional
//
//- (void)dataRequestWithRefresh:(BOOL)isRefresh complete:(void(^)(BOOL isFulfill))complete;

//@end
