//
//  YUNAlbumViewModel.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/4/19.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNAlbumViewModel.h"

@interface YUNAlbumViewModel ()

@property(nonatomic, strong) NSMutableArray<YUNAlbumPhotoModel *> *listItems;

@end

@implementation YUNAlbumViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _listItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadListItemsWithSuccess:(YUNAlbumLoadSuccessBlock)successBlock
                            fail:(YUNAlbumLoadFailBlock)failBlcok {
    // 获取本地bundle中的json数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"photoData" ofType:@"json" inDirectory:@"File.bundle"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    if (!CHECK_VALID_DATA(data)) {
        NSLog(@"photoData is invalid");
        return;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *array = dic[@"data"];
    
    for (NSDictionary *item in array) {
        YUNAlbumPhotoModel *model = [[YUNAlbumPhotoModel alloc] init];
        model.title = item[@"title"];
        model.place = item[@"place"];
        model.date = item[@"date"];
        model.coverImgUrl = item[@"coverImgUrl"];
        
        [self.listItems addObject:model];
    }
    
    successBlock();
}

@end
