//
//  WeChatSelectionManager.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionManager.h"

@interface WeChatSelectionManager() <CTAPIManagerValidator>

@end

@implementation WeChatSelectionManager

- (instancetype)init {
    if (self = [super init]) {
        self.validator = self;
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

- (NSDictionary *)reformParams:(NSDictionary *)params {
    return @{@"pno":@"1",@"ps":@"50",@"key":@"c43f5b0c6ed0a569dd35f9d3211a2037"};;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data {
    return YES;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    return YES;
}
@end
