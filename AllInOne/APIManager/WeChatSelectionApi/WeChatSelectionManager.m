//
//  WeChatSelectionManager.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionManager.h"

@interface WeChatSelectionManager() <CTAPIManagerValidator>
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;
@end

@implementation WeChatSelectionManager

- (instancetype)init {
    if (self = [super init]) {
        self.validator = self;
        self.pageNum = 1;
        self.pageSize = 20;
    }
    return self;
}

- (NSString *)methodName {
    return @"weixin/query";
}

- (NSString *)serviceType {
    return kCTServiceWeChatSelection;
}

- (CTAPIManagerRequestType)requestType {
    return CTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache {
    return YES;
}

- (BOOL)isFirstPage {
    return self.pageNum == 1;
}

- (void)loadNextPage {
    self.pageNum ++;
    [self loadData];
}

- (void)loadFirstPage {
    self.pageNum = 1;
    [self loadData];
}

- (NSDictionary *)reformParams:(NSDictionary *)params {
    return @{@"pno":@(self.pageNum),@"ps":@(self.pageSize),@"key":@"c43f5b0c6ed0a569dd35f9d3211a2037"};;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data {
    return YES;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    return YES;
}
@end
