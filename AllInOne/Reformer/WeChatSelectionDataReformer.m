//
//  WeChatSelectionDataReformer.m
//  AllInOne
//
//  Created by lizhao on 16/8/17.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionDataReformer.h"
#import "WeChatSelectionManager.h"
NSString *const kFirstImg = @"kFirstImg";
NSString *const kId = @"kId";
NSString *const kSource = @"kSource";
NSString *const kWeTitle = @"kWeTitle";
NSString *const kUrl = @"kUrl";
NSString *const kMark = @"kMark";

@interface WeChatSelectionDataReformer ()

@property (nonatomic, strong)NSMutableArray *allDatas;

@end

@implementation WeChatSelectionDataReformer

- (instancetype)init {
    if (self = [super init]) {
        _allDatas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)manager:(CTAPIBaseManager *)manager reformData:(NSDictionary *)data {
    if(((WeChatSelectionManager *)manager).isFirstPage) {
        [_allDatas removeAllObjects];
    }
    NSArray *list = data[@"result"][@"list"];
    for (NSDictionary *dict in list) {
        NSDictionary *viewDict = @{
                                   kFirstImg:dict[@"firstImg"],
                                   kId:dict[@"id"],
                                   kSource:dict[@"source"],
                                   kWeTitle:dict[@"title"],
                                   kUrl:dict[@"url"],
                                   kMark:dict[@"mark"]
                                   };
        [_allDatas addObject:viewDict];
    }
    return _allDatas;
}

@end
