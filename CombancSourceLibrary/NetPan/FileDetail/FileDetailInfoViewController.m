//
//  FileDetailInfoViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/10/15.
//  Copyright © 2018年 王楠. All rights reserved.
//  文件信息

#import "FileDetailInfoViewController.h"
#import <Masonry.h>
#import "StarView.h"

@interface FileDetailInfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) StarView *starView;

@end

@implementation FileDetailInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftLabel = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentRight;
            label.numberOfLines = 0;
            [self.contentView addSubview:label];
            label.frame = CGRectMake(20, 2, 100, 40);
            label;
        });
        [self.contentView addSubview:self.leftLabel];
        
        self.rightLabel = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.numberOfLines = 0;
            [self.contentView addSubview:label];
            label.frame = CGRectMake(125, 2, [UIScreen mainScreen].bounds.size.width - 150, 40);
            label;
        });
        [self.contentView addSubview:self.rightLabel];
    }
    return self;
}

@end

NSString *const FileDetailInfoCellId = @"FileDetailInfoCellId";

@interface FileDetailInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *contentArray;

@end

@implementation FileDetailInfoViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleArray = @[@"资源名称:", @"上传用户:", @"上传时间:", @"大小:", @"类型:", @"评价:"];
   
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(44, 0, 80, 0));
    }];
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:FileDetailInfoCellId forIndexPath:indexPath];
    cell.leftLabel.text = self.titleArray[indexPath.row];
    cell.rightLabel.text = @"测试";
//    NSString *str = self.contentArray[indexPath.row];
//    if (str.length > 0) {
//
//    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[FileDetailInfoCell class] forCellReuseIdentifier:FileDetailInfoCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.scrollEnabled = NO;
    }
    return _myTableView;
}

@end
