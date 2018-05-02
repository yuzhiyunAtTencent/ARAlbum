//
//  YUNAlbumViewModel.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/4/19.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNAlbumViewModel.h"
#import <AFNetworking.h>

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
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://140.143.19.42:8080/arPhotoList"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            
            failBlcok();
        } else {
            NSLog(@"%@", response);
            NSLog(@"%@", responseObject);
            NSArray *resultList = (NSArray*)responseObject;
            for (NSDictionary *item in resultList) {
                YUNAlbumPhotoModel *model = [[YUNAlbumPhotoModel alloc] init];
                model.title = item[@"title"];
                model.place = item[@"place"];
                model.date = item[@"date"];
                model.coverImgUrl = item[@"coverImgUrl"];
                
                [self.listItems addObject:model];
            }
            
            successBlock();
        }
    }];
    [dataTask resume];
}

// 加载本地json文件作为列表
- (void)loadLocalListItemsWithSuccess:(YUNAlbumLoadSuccessBlock)successBlock
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
