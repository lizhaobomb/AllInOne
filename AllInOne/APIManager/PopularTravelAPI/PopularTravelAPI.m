//
//  PopularTravelAPI.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "PopularTravelAPI.h"

@interface PopularTravelAPI () <CTAPIManagerValidator>

@end

@implementation PopularTravelAPI

- (instancetype)init {
    if (self = [super init]) {
        self.validator = self;
    }
    return self;
}

- (NSString *)methodName {
    return @"qunartravel/travellist/travellist";
}

- (NSString *)serviceType {
    return kCTServicePopularTravel;
}

- (CTAPIManagerRequestType)requestType {
    return CTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache {
    return YES;
}

//- (NSDictionary *)reformParams:(NSDictionary *)params {
//    return @{@"page":@"1"};
//}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data {
    return YES;
}

- (BOOL)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    return YES;
}

@end
