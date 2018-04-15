//
//  YUNMainViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/26.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNMainViewController.h"
#import "YUNPhotoCell.h"
#import "MainViewController.h"

@interface YUNMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation YUNMainViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YUNPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YUNPhotoCell class]) forIndexPath:indexPath];
    
//    CListItemType *item = [self.viewModel.listItems safeObjectAtIndex:indexPath.row];
    [cell layoutWithData:@""];
    
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
    
//    CListItemType *item = [self.viewModel.listItems safeObjectAtIndex:indexPath.row];
//    item.hasRead = YES;
//
//    QNControllerParam *param = [QNControllerParam build:^(QNControllerParamBuilder *builder) {
//        builder.commonParam = [QNCommonParam build:^(QNCommonParamBuilder *builder) {
//            builder.listItem = item;
//        }];
//    }];
//    QNQualityCourseDetailController *detailVC = [[QNQualityCourseDetailController alloc] initWithParam:param];
//    detailVC.from = kQNQualityCourseDetailFromPurchased;
//    [self.qn_navigationController pushViewController:detailVC];
//
//    [[CBossFeedback sharedFeedback] reportContentPurchasedNewsClickWithCourseId:item.idStr];
}

@end
