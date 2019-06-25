//
//  DealFileForderView.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//  包含新建、上传、搜索、更多处理的对文件操作的View

#import <UIKit/UIKit.h>

typedef void(^DealFileForderViewSelectedBlock)(NSUInteger index);

@interface DealFileForderView : UIView

// @[@"new_normal", @"upload_normal", @"search_normal", @"more_normal"]
@property (nonatomic, strong) NSArray *iconArray; /**< 按钮的Icon数组，根据所传的Icon数组来生成按钮数量*/
@property (nonatomic, copy) DealFileForderViewSelectedBlock block; /**< 选中回调*/

@end
