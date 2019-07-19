//
//  MineListViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//  我的

#import "MineListViewController.h"
#import "MyDownloadListViewController.h"
#import "SourceLibBaseNavigationController.h"

#import "PublicLibRecoverViewController.h"   //公共库回收站
#import "PanRecycleViewController.h"         //网盘回收站
#import "CollectViewController.h"            //收藏
#import "ReceivePageViewController.h"        //收件
#import "SharePageViewController.h"          //分享

NSString *const MyTableViewCellId = @"MyTableViewCellId";

@interface MineListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView; /**< tableView*/

@end

@implementation MineListViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    NSArray *section0 = @[@{@"image":@"my_collection", @"title":@"收藏"}, @{@"image":@"my_receipt", @"title":@"收件"}, @{@"image":@"my_shared", @"title":@"共享"}];
    NSArray *section1 = @[@{@"image":@"my_LibPub_recyclebin", @"title":@"公共库回收站"}, @{@"image":@"my_SkyDrive_recyclebin", @"title":@"网盘回收站"}];
    NSArray *section2 = @[@{@"image":@"my_download", @"title":@"我的下载"}];

    self.dataArray = @[section0, section1, section2];
    [self.view addSubview:self.myTableView];
    self.myTableView.frame = self.view.bounds;
     
//    [self.navigationController.navigationBar setTranslucent:NO];
    
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCellId forIndexPath:indexPath];

    NSArray *arr = self.dataArray[indexPath.section];
    NSDictionary *dic = arr[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:dic[@"image"]];
    cell.textLabel.text = dic[@"title"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    return array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SourceLibBaseNavigationController *baseNC = (SourceLibBaseNavigationController *)self.navigationController;
    baseNC.backBtnImgWhite = YES;
    if (indexPath.section == 0 && indexPath.row == 0) {
        //收藏
        CollectViewController *collectVC = [[CollectViewController alloc]init];
        collectVC.title = @"收藏列表";
        [self.navigationController pushViewController:collectVC animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        //收件
        ReceivePageViewController *receivePageVC = [[ReceivePageViewController alloc]init];
        receivePageVC.title = @"收件列表";
        [self.navigationController pushViewController:receivePageVC animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 2) {
        //共享
        SharePageViewController *sharePageVC = [[SharePageViewController alloc]init];
        sharePageVC.title = @"共享列表";
        [self.navigationController pushViewController:sharePageVC animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        //公共库回收站
        PublicLibRecoverViewController *publicRecoverVC = [[PublicLibRecoverViewController alloc]init];
        publicRecoverVC.title = @"公共库回收站";
        [self.navigationController pushViewController:publicRecoverVC animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        //网盘回收站
        PanRecycleViewController *panRecycleVC = [[PanRecycleViewController alloc]init];
        panRecycleVC.title = @"网盘回收站";
        [self.navigationController pushViewController:panRecycleVC animated:YES];
    }else {
        MyDownloadListViewController *downLoadVC = [[MyDownloadListViewController alloc] init];
        SourceLibBaseNavigationController *baseNC = (SourceLibBaseNavigationController *)self.navigationController;
        baseNC.backBtnImgWhite = YES;
        [baseNC pushViewController:downLoadVC animated:YES];
    }
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MyTableViewCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

@end
