//
//  WeChatSelectionCell.m
//  AllInOne
//
//  Created by lizhao on 16/8/17.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionCell.h"

@interface WeChatSelectionCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *mainPic;

@end

@implementation WeChatSelectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getters
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIImageView *)mainPic {
    if (!_mainPic) {
        _mainPic = [[UIImageView alloc] init];
    }
    return _mainPic;
}

@end
