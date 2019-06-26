//
//  ReceiveListViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/9.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "ReceiveListViewController.h"
#import "FileForderListCell.h"
#import "MineRequest.h"
#import "MineModel.h"

static NSString *const ReceiveCellID = @"ReceiveCellID";

@interface ReceiveListViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ReceiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc]init];
    
    [self configUI];
    if (self.receiveType == SendType) {
        [self requestSendList];
    }else if (self.receiveType == ReceiveListType) {
        [self requestReceiveList];
    }
}

#pragma mark - ConfigUI

- (void)configUI {
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
    [self.searchBar setPlaceholder:@"搜索"];
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    [self.searchBar setTintColor:[UIColor blueColor]];
    [self.searchBar setShowsCancelButton:NO animated:YES];
//    [self.searchBar setBackgroundImage:[UIColor createImageWithColor:[UIColor darkGrayColor]]];
    UIView *searchTextField = [[[self.searchBar.subviews firstObject] subviews] lastObject];
    [searchTextField setBackgroundColor:[UIColor whiteColor]];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    [self.view addSubview:self.searchBar];
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator = false;
    self.myTableView.showsHorizontalScrollIndicator = false;
    self.myTableView.tableFooterView = [UIView new];
    [self.myTableView registerClass:[FileForderListCell class] forCellReuseIdentifier:ReceiveCellID];
    [self.view addSubview:self.myTableView];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.right.equalTo(self.view);
    }];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.searchBar.mas_bottom);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.searchBar.mas_bottom);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }
    }];
}

#pragma mark - TableViewDelegat&&DataSource

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
    FileForderListCell *cell = [tableView dequeueReusableCellWithIdentifier:ReceiveCellID forIndexPath:indexPath];
    InboxModel *model = self.dataArray[indexPath.row];
    cell.forderNameLabel.text = model.path;
    cell.timeLabel.text = [NSString stringWithFormat:@"上传量:%@",model.uploadCount];
    cell.fileSizeLabel.text = model.createTime;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - SearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO animated:YES];
//    [self requestNewslistWithSearch:@""];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
//    [self requestNewslistWithSearch:searchBar.text];
}

#pragma mark - RequestApi

- (void)requestSendList {
    [MineRequest requestInboxSendWithParam:InboxSendParam(@"admin", @"", @"1", @"10") success:^(id  _Nonnull json) {
        self.dataArray = json;
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

- (void)requestReceiveList {
    [MineRequest requestInboxReceiveWithParam:InboxReceiveParam(@"admin", @"", @"1", @"10") success:^(id  _Nonnull json) {
        self.dataArray = json;
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
