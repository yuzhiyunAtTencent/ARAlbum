//
//  YUNLoginViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/5.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNLoginViewController.h"
#import "YUNLoginView.h"

@interface YUNLoginViewController ()

@property(nonatomic, strong) YUNLoginView *loginView;

@end

@implementation YUNLoginViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.loginView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Accessors
- (YUNLoginView *)loginView {
    if (!_loginView) {
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _loginView = [[YUNLoginView alloc] initWithFrame:frame];
    }
    return _loginView;
}


@end
