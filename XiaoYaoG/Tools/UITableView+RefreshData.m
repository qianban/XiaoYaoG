//
//  UITableView+RefreshData.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/17.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "UITableView+RefreshData.h"
#import <objc/runtime.h>

@interface REWeakObjectContainer :NSObject

@property (nonatomic, readonly, weak) id weakObject;

- (instancetype)initWithWeakObject:(id)object;

@end

#pragma mark - UITableView+RefreshData

static char const * const kFreshDelegate = "freshDelegate";

static char const * const kUploadDelegate = "uploadDelegate";

@implementation UITableView  (RefreshData)

#pragma mark - Getters (Public)

- (id<UITableViewRefreshDelegate>)freshDelegate

{
    
    REWeakObjectContainer *container = objc_getAssociatedObject(self, kFreshDelegate);
    
    return container.weakObject;
    
}

- (id<UITableViewRefreshDelegate>)uploadDelegate

{
    
    REWeakObjectContainer *container = objc_getAssociatedObject(self, kUploadDelegate);
    
    return container.weakObject;
    
}

- (void)beginRefresh {
    
    [self re_beginRefresh];
    
}

- (void)beginUpload {
    
    [self re_beginUpload];
    
}

#pragma mark - Delegate Getters & Events (Private)

- (void)re_beginRefresh {
    
    if(self.freshDelegate && [self.freshDelegate respondsToSelector:@selector(dataRequestWithRefresh:complete:)]) {
        
        if(self.mj_header) {
            
            [self.mj_header beginRefreshing];
            
        }
        
    }
    
}

- (void)re_beginUpload {
    
    if(self.uploadDelegate && [self.uploadDelegate respondsToSelector:@selector(dataRequestWithRefresh:complete:)]) {
        
        if(self.mj_footer) {
            
            [self.mj_footer beginRefreshing];
            
        }
        
    }
    
}

- (void)headerRefereshing {
    
    __weak typeof(self) weakself = self;
    
    // 1.请求数据
    
    [self.freshDelegate dataRequestWithRefresh:YES complete:^(BOOL isFulfill) {
        
        // 结束下拉刷新状态
        
        [weakself.mj_header endRefreshing];
        
        [weakself reloadData];
        
    }];
    
}

- (void)footerRefereshing {
    
    __weak typeof (self) weakself = self;
    
    // 1.请求数据
    
    [self.uploadDelegate dataRequestWithRefresh:NO complete:^(BOOL isFulfill) {
        
        //结束上拉加载状况
        
        if(isFulfill) {
            
            [weakself.mj_footer endRefreshing];
            
        } else {
            
            [weakself.mj_footer endRefreshingWithNoMoreData];
            
        }
        
        // 刷新表格
        
        [weakself reloadData];
        
    }];
    
}

#pragma mark - Setters (Public)

- (void)setFreshDelegate:(id<UITableViewRefreshDelegate>)freshDelegate

{
    
    objc_setAssociatedObject(self, kFreshDelegate, [[REWeakObjectContainer alloc] initWithWeakObject:freshDelegate], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    __weak __typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf headerRefereshing];
        
    }];
    
    self.mj_header = header;
    
}

- (void)setUploadDelegate:(id<UITableViewRefreshDelegate>)uploadDelegate

{
    
    objc_setAssociatedObject(self, kUploadDelegate, [[REWeakObjectContainer alloc] initWithWeakObject:uploadDelegate], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    __weak __typeof(self) weakSelf = self;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf footerRefereshing];
        
    }];
    
    self.mj_footer = footer;
    
}

@end

#pragma mark - REWeakObjectContainer

@implementation REWeakObjectContainer

- (instancetype)initWithWeakObject:(id)object

{
    
    self= [super init];
    
    if(self) {
        
        _weakObject = object;
        
    }
    
    return self;
    
}

@end
