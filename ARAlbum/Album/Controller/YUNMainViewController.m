//
//  YUNMainViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/26.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNMainViewController.h"

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
//        CGRect frame = CGRectMake(0, <#CGFloat y#>, self.view.bounds.size.width, <#CGFloat height#>)
    }
    return _tableView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
