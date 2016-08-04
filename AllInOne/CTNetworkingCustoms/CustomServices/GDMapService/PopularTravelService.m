//
//  PopularTravelService.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "PopularTravelService.h"
#import "CTAppContext.h"
@implementation PopularTravelService

- (BOOL)isOnline {
    return [CTAppContext sharedInstance].isOnline;;
}

- (NSString *)onlineApiBaseUrl {
    return @"http://apis.baidu.com";
}

- (NSString *)offlineApiBaseUrl {
    return @"http://apis.baidu.com";
}

- (NSString *)onlinePublicKey {
    return @"";
}

- (NSString *)offlinePublicKey {
    return @"";
}

- (NSString *)onlinePrivateKey {
    return @"";
}

- (NSString *)offlinePrivateKey {
    return @"";
}

- (NSString *)onlineApiVersion {
    return @"";
}

- (NSString *)offlineApiVersion {
    return @"";
}












@end
