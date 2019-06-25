//
//  FileDetailViewController.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/10/15.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ResourceType){
    VideoType = 0, // 视频类型
    DocType  // 文件、压缩包类型
};

@interface FileDetailViewController : UIViewController

@property (nonatomic, strong) UIView *docView; /**< 显示文件的View*/
@property (nonatomic, strong) UIImageView *docImgV; /**< 文件图片*/
@property (nonatomic, strong) UILabel *docLabel; /**< 文件label*/
@property (nonatomic, assign) ResourceType resourceType;/**< 判断资源类型*/

@end

NS_ASSUME_NONNULL_END
