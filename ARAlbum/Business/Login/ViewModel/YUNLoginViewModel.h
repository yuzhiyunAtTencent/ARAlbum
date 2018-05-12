//
//  YUNLoginViewModel.h
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/9.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^YUNLoginSuccessBlock)(void);
typedef void(^YUNLoginFailBlock)(NSString *error);

@interface YUNLoginViewModel : NSObject

- (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
                  success:(YUNLoginSuccessBlock)successBlock
                    fail:(YUNLoginFailBlock)failBlock;

@end
