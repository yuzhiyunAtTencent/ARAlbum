//
//  YUNPhotoCell.h
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/26.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUNPhotoCell : UITableViewCell

+ (CGFloat)height;

- (void)layoutWithData:(NSString *)item;

@end
