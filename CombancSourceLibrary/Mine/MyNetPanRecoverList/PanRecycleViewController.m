//
//  PanRecycleViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/8.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "PanRecycleViewController.h"
#import "MineRequest.h"
#import "MineModel.h"
#import "FileForderListCell.h"
#import "FileListCell.h"

static NSString *const ForderCellID = @"ForderCellID";
static NSString *const FileCellID = @"FileCellID";

@interface PanRecycleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation PanRecycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self requestAPI];
}

#pragma mark - configUI

- (void)configUI {
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator = false;
    self.myTableView.showsHorizontalScrollIndicator = false;
    self.myTableView.tableHeaderView = [UIView new];
    self.myTableView.tableFooterView = [UIView new];
    [self.myTableView registerClass:[FileForderListCell class] forCellReuseIdentifier:ForderCellID];
    [self.myTableView registerClass:[FileListCell class] forCellReuseIdentifier:FileCellID];
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - TableViewDelegate&&DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileListCell *cell = [tableView dequeueReusableCellWithIdentifier:FileCellID forIndexPath:indexPath];
    RecycleModel *model = self.dataArray[indexPath.row];
//    cell.fileNameLabel.text = model.name;
//    cell.timeLabel.text = model.recycleTime;
//    cell.starView.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -  网络请求

- (void)requestAPI {
    [MineRequest requestPanRecycleListWithParam:PanRecycleListParam(@"1", @"admin") success:^(id  _Nonnull json) {
        self.dataArray = json;
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
