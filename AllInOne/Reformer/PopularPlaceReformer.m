//
//  PopularPlaceReformer.m
//  AllInOne
//
//  Created by lizhao on 16/8/11.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "PopularPlaceReformer.h"

NSString* const kBookUrl = @"kBookUrl";
NSString* const kTitle = @"kTitle";
NSString* const kUserName = @"kUserName";
NSString* const kUserHeadImg = @"kUserHeadImg";
NSString* const kStartTime = @"kStartTime";
NSString* const kRouteDays = @"kRouteDays";
NSString* const kBookImgNum = @"kBookImgNum";
NSString* const kBookText = @"kBookText";

@implementation PopularPlaceReformer

-(id)manager:(CTAPIBaseManager *)manager reformData:(NSDictionary *)data {
    NSArray *tmpArray = data[@"data"][@"books"];
    NSMutableArray *allDicts = [NSMutableArray arrayWithCapacity:4];
    for (NSDictionary *tmpDict in tmpArray) {
        NSDictionary *viewDict = @{kBookUrl:tmpDict[@"bookUrl"],
                                   kUserHeadImg:tmpDict[@"headImage"],
                                   kBookText:tmpDict[@"text"]
                                   };
        [allDicts addObject:viewDict];
    }
    return allDicts;
}

@end
