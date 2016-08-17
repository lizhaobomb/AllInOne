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

@interface WeChatSelectionViewController ()<UITableViewDelegate, UITableViewDataSource, CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) UITableView *wechatSelectionTable;
@property (nonatomic, strong) WeChatSelectionManager *apiManager;
@property (nonatomic, strong) WeChatSelectionDataReformer *dataReformer;

@end

@implementation WeChatSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微信精选";
    [self.view addSubview:self.wechatSelectionTable];
    self.wechatSelectionTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [self.apiManager loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd行",indexPath.row];
    return cell;
}

//#pragma mark - CTAPIManagerParamSource
//- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager {
//    return @{@"pno":@"1",@"ps":@"50",@"key":@"c43f5b0c6ed0a569dd35f9d3211a2037"};
//}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {
    NSArray* data = [manager fetchDataWithReformer:self.dataReformer];
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
        [_wechatSelectionTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _wechatSelectionTable;
}

@end
