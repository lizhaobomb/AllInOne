//
//  CardView.m
//  AllInOne
//
//  Created by lizhao on 16/8/5.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UIColor *shadowColor2 = [UIColor colorWithRed:0.209 green:0.209 blue:0.209 alpha:1];
        
        UIColor *shadow = [shadowColor2 colorWithAlphaComponent:0.73];
        CGSize shadowOffset = CGSizeMake(3.1/2.0, -0.1/2.0);
        CGFloat shadowBlurRadius = 12/2.0;
        self.layer.shadowColor = shadow.CGColor;
        self.layer.shadowOpacity = 0.73;
        self.layer.shadowOffset = shadowOffset;
        self.layer.shadowRadius = shadowBlurRadius;
        self.layer.shouldRasterize = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGFloat frameWidth = rect.size.width;
    CGFloat frameHeight = rect.size.height;
    CGFloat cornerRadius = 10;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *cardColor = self.cardColor;
    
    {
        CGContextSaveGState(context);
        CGContextBeginTransparencyLayer(context, NULL);
        
        UIBezierPath *rectangle4Path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frameWidth, frameHeight) cornerRadius:cornerRadius];
        [cardColor setFill];
        [rectangle4Path fill];
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

@end
