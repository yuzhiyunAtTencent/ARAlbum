//
//  YUNPhotoCell.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/26.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNPhotoCell.h"

@interface YUNPhotoCell()

@property(nonatomic, strong) UIImageView *coverImageView;
@property(nonatomic, strong) UIView *shadowBackgroundView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *placeLabel;
@property(nonatomic, strong) UILabel *dateLabel;

@end

@implementation YUNPhotoCell

+ (CGFloat)height {
    return SP_6P_x1_2(200);
}

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.coverImageView];
        [self.contentView addSubview:self.shadowBackgroundView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.placeLabel];
        [self.contentView addSubview:self.dateLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat kCoverImageViewLeadingSpace = 10;
    const CGFloat kCoverImageViewTopSpace = 5;
    const CGFloat kTitleLabelLeadingSpace = 20;
    const CGFloat kTitleLabelTopSpace = 140;
    const CGFloat kTitleLabelHeight = 20;
    const CGFloat kPlaceLabelTopSpace = 10;
    const CGFloat kPlaceLabelWidth = 150;
    const CGFloat kPlaceLabelHeight = 10;
    const CGFloat kDateLabelWidth = 80;
    const CGFloat kDateLabelHeight = 12;
    const CGFloat kDateLabelTrailingSpace = 10;

    self.coverImageView.frame = CGRectMake(SP_6P_x1_2(kCoverImageViewLeadingSpace), SP_6P_x1_2(kCoverImageViewTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kCoverImageViewLeadingSpace), [YUNPhotoCell height] - 2 * SP_6P_x1_2(kCoverImageViewTopSpace));
    self.shadowBackgroundView.frame = self.coverImageView.frame;
    self.titleLabel.frame = CGRectMake(SP_6P_x1_2(kTitleLabelLeadingSpace), SP_6P_x1_2(kTitleLabelTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kTitleLabelLeadingSpace), SP_6P_x1_2(kTitleLabelHeight));
    self.placeLabel.frame = CGRectMake(SP_6P_x1_2(kTitleLabelLeadingSpace), SP_6P_x1_2(kTitleLabelTopSpace + kPlaceLabelTopSpace + kTitleLabelHeight), SP_6P_x1_2(kPlaceLabelWidth), SP_6P_x1_2(kPlaceLabelHeight));
    self.dateLabel.frame = CGRectMake(0, SP_6P_x1_2(kTitleLabelTopSpace + kPlaceLabelTopSpace + kTitleLabelHeight), SP_6P_x1_2(kDateLabelWidth), SP_6P_x1_2(kDateLabelHeight));
    self.dateLabel.qn_right = SCREEN_WIDTH - SP_6P_x1_2(kDateLabelTrailingSpace);
    
    self.titleLabel.frame = CGRectIntegral(self.titleLabel.frame);
    self.placeLabel.frame = CGRectIntegral(self.placeLabel.frame);
    self.dateLabel.frame = CGRectIntegral(self.dateLabel.frame);
}

#pragma mark - Accessors
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageView.clipsToBounds = YES;
        _coverImageView.layer.cornerRadius = 15;
        _coverImageView.layer.masksToBounds = YES;
    }
    return _coverImageView;
}

- (UIView *)shadowBackgroundView {
    if (!_shadowBackgroundView) {
        _shadowBackgroundView = [[UIView alloc] init];
        _shadowBackgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        _shadowBackgroundView.layer.cornerRadius = 15;
        _shadowBackgroundView.layer.masksToBounds = YES;
    }
    return _shadowBackgroundView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
    }
    return _titleLabel;
}

- (UILabel *)placeLabel {
    if (!_placeLabel) {
        _placeLabel = [[UILabel alloc] init];
        _placeLabel.textColor = [UIColor whiteColor];
    }
    return _placeLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = [UIColor whiteColor];
    }
    return _dateLabel;
}


#pragma mark - Public Methods
- (void)layoutWithData:(NSString *)item {
    NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image.bundle/%@", @"PhotoCover/c.jpg"]];
    self.coverImageView.image = [UIImage imageWithContentsOfFile:imagePath];
    self.titleLabel.text = @"宝宝的2岁生日靓照";
    self.placeLabel.text = @"北京华诚影楼";
    self.dateLabel.text = @"2017.02.03";
}

@end
