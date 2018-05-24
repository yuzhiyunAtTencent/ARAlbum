//
//  YUNLoginView.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/5.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNLoginView.h"

@interface YUNLoginView()

@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UITextView *usrNameTextView;
@property(nonatomic, strong) UITextView *pwdTextView;
@property(nonatomic, strong) UIButton *loginBtn;

@end

@implementation YUNLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        [self addSubview:self.avatarImageView];
        [self addSubview:self.usrNameTextView];
        [self addSubview:self.pwdTextView];
        [self addSubview:self.loginBtn];
        
//        [self p_addTapGesture];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat kAvatarSize = 80;
    const CGFloat kAvatarTopSpace = 100;
    const CGFloat kUsrNameLeadingSpace = 60;
    const CGFloat kUsrNameTopSpace = 30;
    const CGFloat kUsrNameHeight = 30;
    
    const CGFloat kPwdTopSpace = 2;
    const CGFloat kLoginBtnTopSpace = 20;
    const CGFloat kLoginBtnHeight = 40;
    
    self.avatarImageView.frame = CGRectMake((SCREEN_WIDTH - SP_6P_x1_2(kAvatarSize))/2, SP_6P_x1_2(kAvatarTopSpace), SP_6P_x1_2(kAvatarSize), SP_6P_x1_2(kAvatarSize));
    self.avatarImageView.layer.cornerRadius = SP_6P_x1_2(kAvatarSize) / 2;
    self.usrNameTextView.frame = CGRectMake(SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kAvatarTopSpace + kAvatarSize + kUsrNameTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kUsrNameHeight));
    self.pwdTextView.frame = CGRectMake(SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kAvatarTopSpace + kAvatarSize + kUsrNameTopSpace + kUsrNameHeight + kPwdTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kUsrNameHeight));
    self.loginBtn.frame = CGRectMake(SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kAvatarTopSpace + kAvatarSize + kUsrNameTopSpace + kUsrNameHeight * 2 + kPwdTopSpace + kLoginBtnTopSpace), SCREEN_WIDTH - 2 * SP_6P_x1_2(kUsrNameLeadingSpace), SP_6P_x1_2(kLoginBtnHeight));
}

#pragma mark - Accessors
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        //导航栏左上角圆形头像
        NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image.bundle/%@", @"MineInfo/baobao.jpg"]];
        _avatarImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imagePath]];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UITextView *)usrNameTextView {
    if (!_usrNameTextView) {
        _usrNameTextView = [[UITextView alloc] init];
        _usrNameTextView.text = @"15111356293";
    }
    return _usrNameTextView;
}

- (UITextView *)pwdTextView {
    if (!_pwdTextView) {
        _pwdTextView = [[UITextView alloc] init];
        _pwdTextView.text = @"123456";
    }
    return _pwdTextView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = [UIColor greenColor];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        
        [_loginBtn addTarget:self action:@selector(p_loginViewDidTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

#pragma mark - private
//登录
- (void)p_loginViewDidTapped:(id)sender{
    if (CHECK_VALID_DELEGATE(self.actionDelegate, @selector(loginBtnDidTaped))) {
        [self.actionDelegate loginBtnDidTaped];
    }
}

@end
