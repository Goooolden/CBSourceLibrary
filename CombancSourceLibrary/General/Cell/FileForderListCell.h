//
//  FileForderListCell.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileForderListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImgView; /**< 文件夹图*/
@property (nonatomic, strong) UILabel *forderNameLabel; /**< 文件夹名*/
@property (nonatomic, strong) UILabel *timeLabel; /**< 时间*/
@property (nonatomic, strong) UILabel *fileSizeLabel; /**< 文件夹大小*/
@property (nonatomic, strong) UIButton *chooseBtn; /**< 选择文件夹按钮*/

@end
