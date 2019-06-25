//
//  FileDetailViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/10/15.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "FileDetailViewController.h"
#import "FileDetailRootViewController.h"
#import <Masonry.h>

@interface FileDetailViewController ()<WMPageControllerDelegate>
{
    // 分页控制器
    FileDetailRootViewController *pageVC;
    // 附件名字
    NSString *nameStr;
}
@property (nonatomic, strong) UIView *fatherView;
@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation FileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDocView];
    [self createPageVC];
}

- (void)createPageVC {
    pageVC = [[FileDetailRootViewController alloc] init];
    pageVC.delegate = self;
    
    [self.view addSubview:pageVC.view];
    [self.view bringSubviewToFront:self.fatherView];
    [self.view bringSubviewToFront:_docView];
}

#pragma - 创建文档View

- (void)createDocView {
    _docView = [[UIView alloc] init];
    _docView.backgroundColor = [UIColor colorWithRed:238/255.f green:238/255.f blue:244/255.f alpha:1];
    [self.view addSubview:_docView];
    [_docView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        // 注意此处，宽高比16：9优先级比1000低就行，在因为iPhone 4S宽高比不是16：9
        make.height.equalTo(self.docView.mas_width).multipliedBy(9.0f/16.0f).with.priority(750);
    }];
    
    _docImgV = [UIImageView new];
    _docImgV.image = [UIImage imageNamed:@"SourceLibrary.bundle/fileType_manuscripts"];
    _docImgV.contentMode = UIViewContentModeScaleAspectFit;
    [_docView addSubview:_docImgV];
    [_docImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.docView);
        make.centerY.equalTo(self.docView);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
//    NSURL *picUrl = [NSURL URLWithString: KUSERDEFAULT_OBJ4KEY(KMicrolectureCourseResourceSmallPictureUrl)];
//    [_docImgV sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"interaction_default_avator_img"] completed:nil];
    
//    _docLabel = [UILabel new];
//    _docLabel.textColor = [UIColor blueColor];
//    _docLabel.userInteractionEnabled = YES;
//    _docLabel.font = [UIFont systemFontOfSize:15];
//    nameStr = @"测试文档abc.doc";
//    // 添加下划线
//    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:nameStr];
//    NSRange contentRange = {0,[content length]};
//    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
//    _docLabel.attributedText = content;
//
//    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(docLabelClick:)];
//    [_docLabel addGestureRecognizer:tapGes];
//
//    [_docView addSubview:_docLabel];
//
//    [_docLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(_docImgV.mas_bottom).offset(20);
//    }];
//
//    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @"ZFPlayer" ofType:@"bundle"];
//    NSString *imgPath= [bundlePath stringByAppendingPathComponent :@"ZFPlayer_back_full.png"];
//    [backBtn setImage:[UIImage imageNamed:@"microcourse_video_return_btn"] forState:UIControlStateNormal];
//
//    //    [backBtn setImage:[UIImage imageWithContentsOfFile:imgPath] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [_docView addSubview:backBtn];
//
//    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_docView).mas_equalTo(20);
//        make.leading.equalTo(_docView).mas_equalTo(7);
//        make.width.height.mas_equalTo(40);
//    }];
}

#pragma mark - BtnClick

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
