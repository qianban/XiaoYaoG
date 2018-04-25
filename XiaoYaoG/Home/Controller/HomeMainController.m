//
//  HomeViewController.m
//  XiaoYaoG
//
//  Created by 曾宪才 on 2018/3/16.
//  Copyright © 2018年 曾宪才. All rights reserved.
//

#import "HomeMainController.h"
#import "HomeMainViewModel.h"
#import "HomeMainDataSource.h"
#import "HomeMainModel.h"
#import "HomeItemModel.h"

#import "DynamicDetailController.h"


@interface HomeMainController ()<SDCycleScrollViewDelegate,UITableViewRefreshDelegate,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;
@property (weak, nonatomic) IBOutlet UICollectionView *itemCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHeight;

@property (strong, nonatomic) HomeMainViewModel *viewModel;
@property (strong, nonatomic) HomeMainDataSource *dataSource;

@end

@implementation HomeMainController

- (HomeMainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeMainViewModel alloc] init];
    }
    return _viewModel;
}

- (HomeMainDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[HomeMainDataSource alloc] init];
    }
    return _dataSource;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    [self.viewModel.command execute:@0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView layoutIfNeeded];
    [self setControlDataSources];
    [self setRelationRACObserves];
    [self realizeDelegatesAndEvents];
    [self setControlDelegates];
    [self setOrUpdateUI];
}

- (void)setControlDataSources {
    self.tableView.dataSource = self.dataSource;
    self.itemCollectionView.dataSource = self.dataSource;
}

- (void)setRelationRACObserves {
    RAC(_cycleView, localizationImageNamesGroup) = RACObserve(self.viewModel, headerImages);
}

- (void)setControlDelegates {
    self.cycleView.delegate = self;
    self.tableView.delegate = self;
    self.tableView.freshDelegate = self;
    self.itemCollectionView.delegate = self;
}

- (void)realizeDelegatesAndEvents {
    [[self rac_signalForSelector:@selector(cycleScrollView:didSelectItemAtIndex:) fromProtocol:@protocol(SDCycleScrollViewDelegate)] subscribeNext:^(RACTuple *x) {
        DLog(@"%@",x);
        DLog(@"%@",x[0]);
        DLog(@"%@",x[1]);
    }];
    [[self rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)] subscribeNext:^(RACTuple *x) {
        DLog(@"%@",x);
        DLog(@"%@",x[0]);
        DLog(@"%@",x[1]);
        NSIndexPath *indexPath = x[1];
        NSString *indexStr = [NSString stringWithFormat:@"function_%ld",(long)indexPath.row];
        [self performSegueWithIdentifier:indexStr sender:self];
        
    }];
    [[self rac_signalForSelector:@selector(dataRequestWithRefresh:complete:) fromProtocol:@protocol(UITableViewRefreshDelegate)] subscribeNext:^(id x) {
        [self.viewModel.command execute:x];
    }];
    [self.viewModel.subject subscribeNext:^(id x) {
        self.dataSource.dataArray = [self creatArcArray];
        [self.tableView reloadData];
    }];
}

- (void)setOrUpdateUI {
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.6+_itemCollectionView.collectionViewLayout.collectionViewContentSize.height);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"detailContent"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        HomeMainModel *model = [self.dataSource.dataArray objectAtIndex:indexPath.row];
        DynamicDetailController *ddc = segue.destinationViewController;
        ddc.title = model.title;
        DLog(@"%@",indexPath);
    }
}

#pragma mark -- 用于假数据展示// 生成随机数目数组
- (NSArray *)creatArcArray {
    int count = arc4random()%10;
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        HomeMainModel *model = [[HomeMainModel alloc] init];
        model.image = [UIImage imageNamed:[NSString stringWithFormat:@"%03d",arc4random()%count+1]];
        model.title = @"“箫遥阁”论坛甲午仲夏洞箫系列活动之“武汉箫友雅集”";
        model.detail = @"“箫遥阁”论坛甲午仲夏洞箫系列活动之“武汉箫友雅集”已于8月2日完美收官，上午的名家讲坛为各位箫友奉上了一场洞箫之旅的饕餮盛宴，在活动现场，周可奇教授和农新瑜老师为各位箫友讲解了洞箫的发声、吹奏等相关知识，并解答了箫友现场提出的各种疑问，使箫友们受益匪浅，满载而归。";
        [array addObject:model];
    }
    return array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
