//
//  WeChatSelectionDataReformer.m
//  AllInOne
//
//  Created by lizhao on 16/8/17.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionDataReformer.h"

NSString *const kFirstImg = @"kFirstImg";
NSString *const kId = @"kId";
NSString *const kSource = @"kSource";
NSString *const kWeTitle = @"kWeTitle";
NSString *const kUrl = @"kUrl";
NSString *const kMark = @"kMark";

@implementation WeChatSelectionDataReformer

- (id)manager:(CTAPIBaseManager *)manager reformData:(NSDictionary *)data {
    NSArray *list = data[@"result"][@"list"];
    NSMutableArray *allTopics = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        NSDictionary *viewDict = @{
                                   kFirstImg:dict[@"firstImg"],
                                   kId:dict[@"id"],
                                   kSource:dict[@"source"],
                                   kWeTitle:dict[@"title"],
                                   kUrl:dict[@"url"],
                                   kMark:dict[@"mark"]
                                   };
        [allTopics addObject:viewDict];
    }
    return allTopics;
}

@end
