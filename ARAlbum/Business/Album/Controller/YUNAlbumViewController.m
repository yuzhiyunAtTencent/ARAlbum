//
//  YUNAlbumViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/26.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNAlbumViewController.h"
#import "YUNPhotoCell.h"
#import "MainViewController.h"
#import "YUNAlbumViewModel.h"
#import "YUNAlbumPhotoModel.h"

@interface YUNAlbumViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) YUNAlbumViewModel *viewModel;

@end

@implementation YUNAlbumViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.avatarImageView];
    
    [self p_getAlbum];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

#pragma mark - Accessors
- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, kQNNavigationBarHeight_DP + kQNSystemStatusBarHeight, self.view.bounds.size.width, self.view.bounds.size.height - kQNNavigationBarHeight_DP - kQNSystemStatusBarHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YUNPhotoCell class] forCellReuseIdentifier:NSStringFromClass([YUNPhotoCell class])];
    }
    return _tableView;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        //导航栏左上角圆形头像
        NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image.bundle/%@", @"MineInfo/baobao.jpg"]];
        const CGFloat kAvatarSize = 40;
        const CGFloat kAvatarLeadingSpace = 10;
//        const CGFloat kAvatarTopSpace = 10;
        CGRect frame= CGRectMake(kAvatarLeadingSpace, kQNSystemStatusBarHeight, kAvatarSize, kAvatarSize);
        _avatarImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imagePath]];
        [_avatarImageView setFrame:frame];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.layer.cornerRadius = kAvatarSize / 2;
        _avatarImageView.layer.masksToBounds = YES;
        
        //添加点击事件
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_avatarDidTapped:)];
        _avatarImageView.userInteractionEnabled = YES;
        [_avatarImageView addGestureRecognizer:recognizer];
    }
    return _avatarImageView;
}

- (YUNAlbumViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YUNAlbumViewModel alloc] init];
    }
    return _viewModel;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YUNPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YUNPhotoCell class]) forIndexPath:indexPath];
    
    YUNAlbumPhotoModel *item = [self.viewModel.listItems objectAtIndex:indexPath.row];
    [cell layoutWithData:item];
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [YUNPhotoCell height];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
}

#pragma mark - Private Method
- (void)p_getAlbum {
    [self.viewModel loadListItemsWithSuccess:^{
        [self.tableView reloadData];
    } fail:^(NSString *error) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:error preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

//导航栏头像点击事件
-(void)p_avatarDidTapped:(UIGestureRecognizer *) gestureRecognizer{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"退出登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
