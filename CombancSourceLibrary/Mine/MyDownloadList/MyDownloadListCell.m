//
//  MyDownloadListCell.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/17.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "MyDownloadListCell.h"

@interface MyDownloadListCell()

@property (nonatomic, strong) UIImageView *iconImgView; /**< 文件夹图*/
@property (nonatomic, strong) UILabel *forderNameLabel; /**< 文件夹名*/
@property (nonatomic, strong) UILabel *fileSizeLabel; /**< 文件夹大小*/
@property (nonatomic, strong) UIButton *deleteBtn; /**< 选择文件夹按钮*/

@end

@implementation MyDownloadListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSUInteger leftSpace = 20;
        NSUInteger cellHeight = 75;
        
        self.iconImgView = [[UIImageView alloc] init];
        self.iconImgView.frame = CGRectMake(leftSpace, 25, 25, 25);
        self.iconImgView.image = [UIImage imageNamed:@"SourceLibrary.bundle/Folder"];
        self.iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconImgView];
        
        self.forderNameLabel = [[UILabel alloc] init];
        self.forderNameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImgView.frame) + 25, 10, 200, 30);
        self.forderNameLabel.textAlignment = NSTextAlignmentLeft;
        self.forderNameLabel.font = [UIFont systemFontOfSize:17];
        self.forderNameLabel.text = @"文件名称 新建文件夹";
        [self.contentView addSubview:self.forderNameLabel];
        
        
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        
        self.fileSizeLabel = [[UILabel alloc] init];
        self.fileSizeLabel.frame = CGRectMake(self.forderNameLabel.frame.origin.x, CGRectGetMaxY(self.forderNameLabel.frame), 150, 30);
        self.fileSizeLabel.textAlignment = NSTextAlignmentLeft;
        self.fileSizeLabel.font = [UIFont systemFontOfSize:14];
        self.fileSizeLabel.text = @"2018KB";
        [self.contentView addSubview:self.fileSizeLabel];
        
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.deleteBtn.frame = CGRectMake(screenW - 30, (cellHeight - 15)/2, 15, 15);
        [self.deleteBtn setImage:[UIImage imageNamed:@"SourceLibrary.bundle/Mydownload_delete"] forState:UIControlStateNormal];
        [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.deleteBtn];
        
    }
    return self;
}

- (void)deleteBtnClick:(UIButton *)sender {

}

@end
