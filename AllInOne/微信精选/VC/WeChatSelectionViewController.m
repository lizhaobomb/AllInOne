//
//  WeChatSelectionViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionViewController.h"
#import "SDAutoLayout.h"
#import "WeChatSelectionManager.h"
#import "WeChatSelectionDataReformer.h"
#import "WeChatSelectionCell.h"
#import "WeChatSelectionDetailViewController.h"
#import "MJRefresh.h"

@interface WeChatSelectionViewController ()<UITableViewDelegate, UITableViewDataSource, CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) UITableView *wechatSelectionTable;
@property (nonatomic, strong) WeChatSelectionManager *apiManager;
@property (nonatomic, strong) WeChatSelectionDataReformer *dataReformer;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation WeChatSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微信精选";
    [self loadSubViews];
    [self setupConstraints];
    [self setupRefreshHeaderAndFooter];
    [self.apiManager loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSubViews {
    [self.view addSubview:self.wechatSelectionTable];
}

- (void)setupRefreshHeaderAndFooter {
    self.wechatSelectionTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    self.wechatSelectionTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
    }];
}

- (void)setupConstraints {
    self.wechatSelectionTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

#pragma mark - UITableViewDelegate 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeChatSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.cellData = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *data = self.dataSource[indexPath.row];
    WeChatSelectionDetailViewController *detailVC = [[WeChatSelectionDetailViewController alloc] init];
    detailVC.url = data[kUrl];
    [self.navigationController pushViewController:detailVC animated:YES];
}

//#pragma mark - CTAPIManagerParamSource
//- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager {
//    return @{@"pno":@"1",@"ps":@"50",@"key":@"c43f5b0c6ed0a569dd35f9d3211a2037"};
//}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {
    NSArray* data = [manager fetchDataWithReformer:self.dataReformer];
    self.dataSource = data;
    [self.wechatSelectionTable reloadData];
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager {

}

#pragma mark - getters

- (WeChatSelectionDataReformer *)dataReformer {
    if (!_dataReformer) {
        _dataReformer = [[WeChatSelectionDataReformer alloc] init];
    }
    return _dataReformer;
}

- (WeChatSelectionManager *)apiManager {
    if (!_apiManager) {
        _apiManager = [[WeChatSelectionManager alloc] init];
        _apiManager.delegate = self;
//        _apiManager.paramSource = self;
    }
    return _apiManager;
}

- (UITableView *)wechatSelectionTable {
    if (!_wechatSelectionTable) {
        _wechatSelectionTable = [UITableView new];
        _wechatSelectionTable.delegate = self;
        _wechatSelectionTable.dataSource = self;
        [_wechatSelectionTable registerClass:[WeChatSelectionCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _wechatSelectionTable;
}

@end
