//
//  YUNLoginView.h
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/5.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YUNLoginViewActionDelegate <NSObject>

@required
- (void)loginBtnDidTaped;

@end

@interface YUNLoginView : UIView

@property(nonatomic, strong, readonly) UITextView *usrNameTextView;
@property(nonatomic, strong, readonly) UITextView *pwdTextView;

@property(nonatomic, weak) id<YUNLoginViewActionDelegate> actionDelegate;

@end
