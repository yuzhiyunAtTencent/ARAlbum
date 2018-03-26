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

@end

@implementation YUNPhotoCell

+ (CGFloat)height {
    return SP_6P_x1_2(200);
}

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.coverImageView];
//        [self.contentView addSubview:self.separatorLineImage];
//        [self.contentView addSubview:self.titleLabel];
//        [self.contentView addSubview:self.courseDurationLabel];
//        [self.contentView addSubview:self.progressLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat kCoverImageViewLeadingSpace = 10;
    const CGFloat kCoverImageViewTopSpace = 12;

    self.coverImageView.frame = CGRectMake(SP_6P_x1_2(kCoverImageViewLeadingSpace), SP_6P_x1_2(kCoverImageViewTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kCoverImageViewLeadingSpace), [YUNPhotoCell height] - 2 * SP_6P_x1_2(kCoverImageViewTopSpace));
//    const CGFloat kTitleLabelLeadingSpace = 12;
//    const CGFloat kTitleLabelTopSpace = 16;
//    const CGFloat kTitleLabelHeight = 22;
//    const CGFloat kCourseDurationLabelTopSpace = 5;
//    const CGFloat kCourseDurationLabelHeight = 14;
//    const CGFloat kProgressLabelHeight = 14;
//    const CGFloat kProgressLabelTopSpace = 5;
//    
//    const CGFloat kLabelX = kTitleLabelLeadingSpace + kCoverImageViewWidth + kCoverImageViewLeadingSpace;
//    const CGFloat kLabelWidth = SCREEN_WIDTH - kCoverImageViewLeadingSpace - kCoverImageViewWidth - kTitleLabelLeadingSpace;
//    
//    self.coverImageView.frame = CGRectMake(SP_6P_x1_2(kCoverImageViewLeadingSpace), SP_6P_x1_2(kCoverImageViewTopSpace), SP_6P_x1_2(kCoverImageViewWidth), SP_6P_x1_2(kCoverImageViewHeight));
//    self.titleLabel.frame = CGRectMake(SP_6P_x1_2(kLabelX), SP_6P_x1_2(kTitleLabelTopSpace), SP_6P_x1_2(kLabelWidth), SP_6P_x1_2(kTitleLabelHeight));
//    self.courseDurationLabel.frame = CGRectMake(SP_6P_x1_2(kLabelX), SP_6P_x1_2(kTitleLabelTopSpace + kTitleLabelHeight + kCourseDurationLabelTopSpace), SP_6P_x1_2(kLabelWidth), SP_6P_x1_2(kCourseDurationLabelHeight));
//    self.progressLabel.frame = CGRectMake(SP_6P_x1_2(kLabelX), self.courseDurationLabel.qn_bottom + SP_6P_x1_2(kProgressLabelTopSpace), SP_6P_x1_2(kLabelWidth), SP_6P_x1_2(kProgressLabelHeight));
//    self.separatorLineImage.frame = CGRectMake(SP_6P_x1_2(kQNCellInsets.left), 0, SCREEN_WIDTH - SP_6P_x1_2(kQNCellInsets.left + kQNCellInsets.right), 1);
//    self.separatorLineImage.qn_bottom = self.qn_height;
//    
//    self.titleLabel.frame = CGRectIntegral(self.titleLabel.frame);
//    self.courseDurationLabel.frame = CGRectIntegral(self.courseDurationLabel.frame);
//    self.progressLabel.frame = CGRectIntegral(self.progressLabel.frame);
}

#pragma mark - Accessors
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageView.clipsToBounds = YES;
    }
    return _coverImageView;
}

#pragma mark - Public Methods
- (void)layoutWithData:(NSString *)item {
    NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image.bundle/%@", @"PhotoCover/c.jpg"]];
    self.coverImageView.image = [UIImage imageWithContentsOfFile:imagePath];
}

@end
