//
//  WeChatSelectionService.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionService.h"
#import "CTAppContext.h"

@implementation WeChatSelectionService

#pragma mark - CTServiceProtocal
- (BOOL)isOnline
{
    return [CTAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"http://v.juhe.cn";
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://v.juhe.cn";
}

- (NSString *)offlineApiVersion
{
    return @"";
}

- (NSString *)onlineApiVersion
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlinePublicKey
{
    return @"";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return @"";
}

@end
