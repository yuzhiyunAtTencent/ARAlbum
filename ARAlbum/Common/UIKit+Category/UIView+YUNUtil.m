//
//  UIView+YUNUtil.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/27.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "UIView+YUNUtil.h"

@implementation UIView (YUNUtil)

- (CGFloat)qn_left {
    return self.frame.origin.x;
}

- (void)setQn_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)qn_top {
    return self.frame.origin.y;
}

- (void)setQn_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)qn_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setQn_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)qn_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setQn_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)qn_centerX {
    return self.center.x;
}

- (void)setQn_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)qn_centerY {
    return self.center.y;
}

- (void)setQn_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)qn_innerCenter {
    return CGPointMake(self.qn_boundsWidth / 2, self.qn_boundsHeight / 2);
}

- (CGFloat)qn_width {
    return self.frame.size.width;
}

- (void)setQn_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)qn_height {
    return self.frame.size.height;
}

- (void)setQn_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)qn_origin {
    return self.frame.origin;
}

- (void)setQn_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)qn_size {
    return self.frame.size;
}

- (void)setQn_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)qn_boundsHeight {
    return self.bounds.size.height;
}

- (CGFloat)qn_boundsWidth {
    return self.bounds.size.width;
}

@end
