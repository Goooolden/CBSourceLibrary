//
//  NetPanFileForderListViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/14.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "NetPanFileForderListViewController.h"
#import "FileForderListCell.h"
#import "FileListCell.h"
#import "DealFileForderView.h"
#import "NetPanRequest.h"
#import "RootPanModel.h"
#import "LibraryUserDefault.h"

#import "FileDetailViewController.h"
#import "SourceLibBaseNavigationController.h"

static NSString *const NetPanFileForderListCellId = @"NetPanFileForderListCellId";
static NSString *const NetPanFileListCellId       = @"NetPanFileListCellId";

@interface NetPanFileForderListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView; /**< tableView*/
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation NetPanFileForderListViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网盘";
    
    // 文件操作View
    DealFileForderView *dealForderView = [[DealFileForderView alloc] init];
    dealForderView.iconArray = @[@"SourceLibrary.bundle/new_normal", @"SourceLibrary.bundle/upload_normal", @"SourceLibrary.bundle/search_normal", @"SourceLibrary.bundle/more_normal"];
    CGFloat height = CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame);
    height = 0;
    dealForderView.frame = CGRectMake(0, height, self.view.bounds.size.width, 50);
    dealForderView.block = ^(NSUInteger index) {
        NSLog(@"index: %@", [NSNumber numberWithInteger:index]);
    };
    [self.view addSubview:dealForderView];

    _dataArray = [[NSMutableArray alloc]init];
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(dealForderView.mas_bottom);
    }];
    
    if (self.next) {
        [self requestNextRootfloderList:self.parentId];
    }else {
        [self requestRootfloderList];
    }
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[FileListCell class] forCellReuseIdentifier:NetPanFileForderListCellId];
        [_myTableView registerClass:[FileForderListCell class] forCellReuseIdentifier:NetPanFileListCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootPanModel *model = self.dataArray[indexPath.row];
    if (model.type.length > 0) {
        //文件
        FileListCell *cell = [tableView dequeueReusableCellWithIdentifier:NetPanFileForderListCellId forIndexPath:indexPath];
        cell.fileNameLabel.text = model.name;
        cell.timeLabel.text = model.createTime;
        cell.iconImgView.image = [UIImage imageNamed:@"SourceLibrary.bundle/Folder"];
        if (model.type.length > 0) {
            NSString *UrlString = [NSString stringWithFormat:@"%@/%@",BaseUrl,model.img];
            [cell.iconImgView sd_setImageWithURL:[NSURL URLWithString:UrlString]];
        }
        return cell;
    }else {
        //文件夹
        FileForderListCell *cell = [tableView dequeueReusableCellWithIdentifier:NetPanFileListCellId forIndexPath:indexPath];
        cell.forderNameLabel.text = model.name;
        cell.timeLabel.text = model.createTime;
        cell.iconImgView.image = [UIImage imageNamed:@"SourceLibrary.bundle/Folder"];
        if (model.type.length > 0) {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BaseUrl,model.img]];
            [cell.iconImgView sd_setImageWithURL:url];
            cell.fileSizeLabel.text = [NSString stringWithFormat:@"%@KB",model.size];
        }
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
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
    SourceLibBaseNavigationController *baseNC = (SourceLibBaseNavigationController *)self.navigationController;
    baseNC.backBtnImgWhite = YES;
    RootPanModel *model = self.dataArray[indexPath.row];
    if (model.type.length > 0) {
        FileDetailViewController *vc = [[FileDetailViewController alloc] init];
        LibraryUserDefault *libraryDefault = [LibraryUserDefault shareInstance];
        libraryDefault.rootPanModel = model;
        [baseNC pushViewController:vc animated:YES];
    }else {
        NetPanFileForderListViewController *listVC = [[NetPanFileForderListViewController alloc]init];
        listVC.parentId = model.id;
        listVC.next = true;
        [self.navigationController pushViewController:listVC animated:YES];
    }
}

#pragma mark - 网络请求

- (void)requestRootfloderList {
    [NetPanRequest NetPanRequestRootfloderWithParam:PanRootfloderParameter(@"admin") success:^(id  _Nonnull json) {
        self.dataArray = [self deleteOpenFloderWithArray:json];
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

- (void)requestNextRootfloderList:(NSString *)parentId {
    [NetPanRequest NetPanRequestNextFloderWithParam:PanNextFloderParameter(parentId) success:^(id  _Nonnull json) {
        self.dataArray = [self deleteOpenFloderWithArray:json];
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

//返回的是展开后的全部数据，现在只显示第一级目录
- (NSMutableArray *)deleteOpenFloderWithArray:(NSMutableArray *)array {
    NSMutableArray *nextArray = [NSMutableArray arrayWithArray:array];
    for (RootPanModel *model in array) {
        if (model.open) {
            [nextArray removeObject:model];
        }
    }
    return nextArray;
}

@end
