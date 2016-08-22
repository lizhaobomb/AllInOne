//
//  WeChatSelectionManager.h
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "CTAPIBaseManager.h"

@interface WeChatSelectionManager : CTAPIBaseManager <CTAPIManager>

- (void)loadNextPage;
- (void)loadFirstPage;
- (BOOL)isFirstPage;

@end
