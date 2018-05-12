//
//  YUNLoginViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/5.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNLoginViewController.h"
#import "YUNLoginView.h"
#import "YUNAlbumViewController.h"
#import "YUNLoginViewModel.h"

@interface YUNLoginViewController () <YUNLoginViewActionDelegate>

@property(nonatomic, strong) YUNLoginView *loginView;
@property(nonatomic, strong) YUNLoginViewModel *viewModel;

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
        
        _loginView.actionDelegate = self;
    }
    return _loginView;
}

- (YUNLoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YUNLoginViewModel alloc] init];
    }
    return _viewModel;
}

#pragma mark - YUNLoginViewActionDelegate
- (void)loginBtnDidTaped {
    [self.viewModel loginWithUserName:self.loginView.usrNameTextView.text pwd:self.loginView.pwdTextView.text success:^{
        YUNAlbumViewController *controller = [[YUNAlbumViewController alloc] init];
        controller.userId = @"0";
        [self.navigationController pushViewController:controller animated:YES];
    } fail:^(NSString *error) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:error preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

@end
