//
//  FileDetailCommentViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/10/15.
//  Copyright © 2018年 王楠. All rights reserved.
//  文件评论

#import "FileDetailCommentViewController.h"
#import <Masonry.h>

@interface FileDetailCommentCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImgV;/**< 头像图片*/
@property (nonatomic, strong) UILabel *nameLabel;/**< 姓名*/
@property (nonatomic, strong) UILabel *timeLabel;/**< 时间*/
@property (nonatomic, strong) UILabel *titleLabel;/**< 标题*/

@end

@implementation FileDetailCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 头像
        self.iconImgV = [UIImageView new];
        [self.contentView addSubview:self.iconImgV];
        [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(15);
            make.left.equalTo(self.contentView).offset(15);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        self.nameLabel = [UILabel new];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.textColor = [UIColor grayColor];
        self.nameLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImgV);
            make.left.equalTo(self.iconImgV.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right);
            make.bottom.equalTo(self.nameLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(200, 20));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 100;
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.timeLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-16);
            // make.bottom.equalTo(self.contentV.mas_bottom);
        }];
        
    }
    return self;
}

@end

NSString *const FileDetailCommentCellId = @"FileDetailCommentCellId";

@interface FileDetailCommentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FileDetailCommentViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myTableView];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(44, 0, 80, 0));
    }];
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[FileDetailCommentCell class] forCellReuseIdentifier:FileDetailCommentCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
    }
    return _myTableView;
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:FileDetailCommentCellId forIndexPath:indexPath];
    cell.nameLabel.text = @"李白杜甫";
    cell.timeLabel.text = @"2018-10-19 16:41:21";
    cell.titleLabel.text = @"昨日，财政部举行新闻发布会，财政部税政司副巡视员袁海尧表示，将全面落实已出台的减税降费政策 ... 完善出口退税政策操作文件将于近日印发，个人所得税专项附加扣除具体办法正在研究制定过程中。同时，正在抓紧研究更大规模的减税、更加明显的降费措施 ... 今年在完成年初《政府工作报告》确定的 1.1 万亿元减税降费措施基础上，又出台了一系列措施，预计全年可减轻税费负担 1.3 万亿元以上。";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
