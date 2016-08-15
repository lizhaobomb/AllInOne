//
//  CardView.h
//  AllInOne
//
//  Created by lizhao on 16/8/5.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (nonatomic,strong) UIColor *cardColor;

- (void)configWithData:(id)data;

@end
