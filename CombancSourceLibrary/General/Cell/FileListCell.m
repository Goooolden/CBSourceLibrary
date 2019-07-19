//
//  FileListCell.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "FileListCell.h"

@interface FileListCell ()

@end

@implementation FileListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSUInteger leftSpace = 20;
        
        self.iconImgView = [[UIImageView alloc] init];
        self.iconImgView.frame = CGRectMake(leftSpace, 25, 25, 25);
        self.iconImgView.image = [UIImage imageNamed:@"SourceLibrary.bundle/fileType_audio"];
        self.iconImgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconImgView];
        
        self.fileNameLabel = [[UILabel alloc] init];
        self.fileNameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImgView.frame) + 25, 10, 200, 30);
        self.fileNameLabel.textAlignment = NSTextAlignmentLeft;
        self.fileNameLabel.font = [UIFont systemFontOfSize:17];
        self.fileNameLabel.text = @"文件名称 那些花儿.mp3";
        [self.contentView addSubview:self.fileNameLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.frame = CGRectMake(self.fileNameLabel.frame.origin.x, CGRectGetMaxY(self.fileNameLabel.frame)+ 10, 150, 15);
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.text = @"2018-09-14 16:58";
        [self.contentView addSubview:self.timeLabel];
        
        self.starView = [[StarView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.timeLabel.frame), CGRectGetMaxY(self.fileNameLabel.frame) +10, 100, 15) numberOfStars:5];
        self.starView.scorePercent = 0.8;
        self.starView.allowIncompleteStar = NO;
        self.starView.hasAnimation = NO;
        self.starView.userInteractionEnabled = NO;
        [self.contentView addSubview:self.starView];
    }
    return self;
}

@end
