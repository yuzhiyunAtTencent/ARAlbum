//
//  UIView+YUNUtil.h
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/27.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YUNUtil)

@property(nonatomic /* override */) CGFloat qn_left;

@property(nonatomic /* override */) CGFloat qn_top;

@property(nonatomic /* override */) CGFloat qn_right;

@property(nonatomic /* override */) CGFloat qn_bottom;

@property(nonatomic /* override */) CGFloat qn_width;

@property(nonatomic /* override */) CGFloat qn_height;

@property(nonatomic /* override */) CGFloat qn_centerX;

@property(nonatomic /* override */) CGFloat qn_centerY;

@property(nonatomic /* override */, readonly) CGPoint qn_innerCenter;

@property(nonatomic /* override */) CGPoint qn_origin;

@property(nonatomic /* override */) CGSize qn_size;

@property(nonatomic, readonly) CGFloat qn_boundsWidth;
@property(nonatomic, readonly) CGFloat qn_boundsHeight;


@end
