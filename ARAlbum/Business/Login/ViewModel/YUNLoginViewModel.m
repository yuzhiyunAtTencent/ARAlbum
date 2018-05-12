//
//  YUNLoginViewModel.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/9.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNLoginViewModel.h"
#import <AFNetworking.h>

@implementation YUNLoginViewModel

- (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
                  success:(YUNLoginSuccessBlock)successBlock
                     fail:(YUNLoginFailBlock)failBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *urlString = [NSString stringWithFormat:@"http://140.143.19.42:8080/login?userName=%@&pwd=%@",userName,pwd];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            
            failBlock(@"网络错误或服务器发生未知错误");
        } else {
            NSLog(@"%@", response);
            NSLog(@"%@", responseObject);
            NSDictionary *responseDic = (NSDictionary*)responseObject;
            if ([responseDic[@"code"] isEqualToString:@"0"]) {
                successBlock();
            } else {
                failBlock(responseDic[@"msg"]);
            }
        }
    }];
    [dataTask resume];
}

@end
