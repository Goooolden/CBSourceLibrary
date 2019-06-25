//
//  CollectViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/8.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "CollectViewController.h"
#import "FileForderListCell.h"
#import "MineRequest.h"
#import "MineModel.h"

static NSString *const FileForderListCellID = @"FileForderListCellID";

@interface CollectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self requestApi];
}

#pragma mark - ConfigUI

- (void)configUI {
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator = false;
    self.myTableView.showsHorizontalScrollIndicator = false;
    [self.myTableView registerClass:[FileForderListCell class] forCellReuseIdentifier:FileForderListCellID];
    self.myTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate&&UITableViewDataSource

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
    FileForderListCell *cell = [tableView dequeueReusableCellWithIdentifier:FileForderListCellID forIndexPath:indexPath];
    CollectionModel *model = self.dataArray[indexPath.row];
    cell.forderNameLabel.text = model.fileName;
    cell.fileSizeLabel.text = [NSString stringWithFormat:@"%@KB",model.fileSize];
    NSString *URLString = [NSString stringWithFormat:@"%@/zyk/%@",BaseUrl,model.fileIcon];
    [cell.iconImgView sd_setImageWithURL:[NSURL URLWithString:URLString]];
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

#pragma mark - RequestApi

- (void)requestApi {
    [MineRequest requestCollectListWithParam:CollectListParam(@"", @"admin", @"1", @"10") success:^(id  _Nonnull json) {
        self.dataArray = json;
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
