//
//  MyDownloadListViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/17.
//  Copyright © 2018年 王楠. All rights reserved.
//  我的下载

#import "MyDownloadListViewController.h"
#import "MyDownloadListCell.h"

NSString *const MyDownloadListCellId = @"MyDownloadListCellId";

@interface MyDownloadListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView; /**< tableView*/
@property (nonatomic, strong) NSArray *dataArray;


@end

@implementation MyDownloadListViewController


#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的下载";
    
    _dataArray = @[];
    [self.view addSubview:self.myTableView];
    self.myTableView.frame = self.view.bounds;
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[MyDownloadListCell class] forCellReuseIdentifier:MyDownloadListCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
    }
    return _myTableView;
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyDownloadListCell *cell = [tableView dequeueReusableCellWithIdentifier:MyDownloadListCellId forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
