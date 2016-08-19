//
//  WeChatSelectionCell.m
//  AllInOne
//
//  Created by lizhao on 16/8/17.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionCell.h"
#import "SDAutoLayout.h"
#import "PlaceReformKeys.h"
#import "YYWebImage.h"
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
        [self loadSubViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadSubViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.mainPic];
}

- (void)setupConstraints {
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(20);
    
    self.mainPic.sd_layout
    .topSpaceToView(self.titleLabel,0)
    .leftEqualToView(self.titleLabel)
    .rightEqualToView(self.titleLabel)
    .heightIs(100);
}

#pragma mark - getters & setters
- (void)setCellData:(NSDictionary *)cellData {
    _cellData = cellData;
    self.titleLabel.text = cellData[kWeTitle];
    [self.mainPic yy_setImageWithURL:[NSURL URLWithString:cellData[kFirstImg]] options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
}

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
