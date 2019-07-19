//
//  FileListCell.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

@interface FileListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImgView; /**< 文件图*/
@property (nonatomic, strong) UILabel *fileNameLabel; /**< 文件名*/
@property (nonatomic, strong) UILabel *timeLabel; /**< 时间*/
@property (nonatomic, strong) UILabel *scoreLabel; /**< 评分*/
@property (nonatomic, strong) StarView *starView; /**< 星星*/

@end
