//
//  YUNAlbumViewModel.h
//  ARAlbum
//
//  Created by 俞志云 on 2018/4/19.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUNAlbumPhotoModel.h"

typedef void (^YUNAlbumLoadSuccessBlock)(void);
typedef void (^YUNAlbumLoadFailBlock)(NSString *error);

@interface YUNAlbumViewModel : NSObject

@property(nonatomic, strong, readonly) NSMutableArray<YUNAlbumPhotoModel *> *listItems;

- (void)loadListItemsWithSuccess:(YUNAlbumLoadSuccessBlock)successBlock
                            fail:(YUNAlbumLoadFailBlock)failBlock;

@end
