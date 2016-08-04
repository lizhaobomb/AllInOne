//
//  WeChatSelectionViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionViewController.h"
#import "SDAutoLayout.h"

@interface WeChatSelectionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *wechatSelectionTable;

@end

@implementation WeChatSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微信精选";
    [self.view addSubview:self.wechatSelectionTable];
    self.wechatSelectionTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));

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

#pragma mark - getters
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
