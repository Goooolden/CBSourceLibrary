//
//  FileForderListCell.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "FileForderListCell.h"
#import "UtilsMacro.h"
#import "Masonry.h"

@interface FileForderListCell ()

@end

@implementation FileForderListCell

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
        self.forderNameLabel.text = @"";
        [self.contentView addSubview:self.forderNameLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.frame = CGRectMake(self.forderNameLabel.frame.origin.x, CGRectGetMaxY(self.forderNameLabel.frame), 150, 30);
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.text = @"";
        [self.contentView addSubview:self.timeLabel];

        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        
        self.fileSizeLabel = [[UILabel alloc] init];
        self.fileSizeLabel.frame = CGRectMake(screenW - 130, CGRectGetMaxY(self.forderNameLabel.frame), 80, 30);
        self.fileSizeLabel.textAlignment = NSTextAlignmentRight;
        self.fileSizeLabel.font = [UIFont systemFontOfSize:14];
        self.fileSizeLabel.text = @"";
        [self.contentView addSubview:self.fileSizeLabel];

        self.chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.chooseBtn.frame = CGRectMake(screenW - 30, (cellHeight - 15)/2, 15, 15);
//        [self.chooseBtn setImage:[UIImage imageNamed:@"cb_normal"] forState:UIControlStateNormal];
//        [self.chooseBtn setImage:[UIImage imageNamed:@"cb_pressed"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.chooseBtn];

    }
    return self;
}


@end
