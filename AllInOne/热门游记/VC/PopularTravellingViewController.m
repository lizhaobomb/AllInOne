//
//  PopularTravellingViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "PopularTravellingViewController.h"
#import "SDAutoLayout.h"
#import "PopularTravelAPI.h"

@interface PopularTravellingViewController () <CTAPIManagerCallBackDelegate,CTAPIManagerParamSource>
@property (nonatomic, strong) UITableView *travelTable;
@property (nonatomic, strong) PopularTravelAPI *popularTravelAPI;
@end

@implementation PopularTravellingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.travelTable];
    self.travelTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [self.popularTravelAPI loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager {

}

- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {

}

#pragma makr - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager {
    return @{@"query":@"",@"page":@"1"};
}

#pragma mark - getters
- (PopularTravelAPI *)popularTravelAPI {
    if (!_popularTravelAPI) {
        _popularTravelAPI = [[PopularTravelAPI alloc] init];
        _popularTravelAPI.delegate = self;
        _popularTravelAPI.paramSource = self;
    }
    return _popularTravelAPI;
}

- (UITableView *)travelTable {
    if (!_travelTable) {
        _travelTable = [UITableView new];
    }
    return _travelTable;
}


@end
