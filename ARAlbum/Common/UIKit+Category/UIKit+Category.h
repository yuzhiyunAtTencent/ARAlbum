//
//  UIKit+Category.h
//  Helloworld
//
//  Created by zhiyunyu on 2018/2/6.
//  Copyright © 2018年 zhiyunyu. All rights reserved.
//

#import "UIScreen+YunUtils.h"

static CGFloat qn_pixel_scale = 0.0f;

CG_INLINE CGFloat QNPixelScale() {
    if (qn_pixel_scale == 0.0f) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            qn_pixel_scale = SCREEN_WIDTH / 320.0f;
        else
            qn_pixel_scale = 1.0f;
    }
    return qn_pixel_scale;
};

CG_INLINE NSInteger SP(float x, CGFloat scale) {
    return (int)(scale * x + 0.5f);
}

CG_INLINE NSInteger SP_6P(float x, CGFloat scale);
CG_INLINE NSInteger SP_6P(float x, CGFloat scale) {
    return SP(x, IS_IPHONE_6PLUS ? scale : QNPixelScale());
}
#define SP_6P_x1_2(x) SP_6P(x, 1.2f)
