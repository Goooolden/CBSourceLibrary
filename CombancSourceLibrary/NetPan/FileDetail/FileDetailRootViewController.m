//
//  FileDetailRootViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/10/15.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "FileDetailRootViewController.h"
#import "FileDetailInfoViewController.h"
#import "FileDetailCommentViewController.h"

@interface FileDetailRootViewController ()<WMPageControllerDelegate, WMPageControllerDataSource>

@end

@implementation FileDetailRootViewController

#pragma mark -

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pageAnimatable = YES;
        self.delegate = self;
        self.dataSource = self;
        self.progressColor = [UIColor blueColor];
        self.titleColorSelected = [UIColor blueColor]; //标题选中时的颜色
        self.titleColorNormal = [UIColor blackColor];  //标题非选中的颜色
        self.menuView.backgroundColor = [UIColor whiteColor];
        self.progressWidth = 60;
        self.menuViewStyle = WMMenuViewStyleLine;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.menuViewStyle = WMMenuViewStyleLine;

    self.menuView.lineColor = [UIColor blueColor];
    self.titleSizeSelected = [UIScreen mainScreen].bounds.size.width > 320 ? 17.0 : 16.0;
    self.titleSizeNormal = [UIScreen mainScreen].bounds.size.width > 320 ? 16.0 : 15.0;
    self.itemsWidths = @[@(80), @(80)];
    self.itemMargin = 1.0;
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressWidth = 60;

    self.menuView.contentMargin = 1.0;
    self.progressColor = [UIColor blueColor];
    self.titleColorSelected = [UIColor blueColor]; //标题选中时的颜色
    self.titleColorNormal = [UIColor blackColor];  //标题非选中的颜色
    self.menuView.backgroundColor = [UIColor whiteColor];
    self.menuItemWidth = [UIScreen mainScreen].bounds.size.width/2;
}

#pragma mark -

- (NSArray<NSString *> *)titles {
    return @[@"基本信息", @"评论列表"];
}

#pragma mark - WMPageController DataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index == 0) {
        // 基本信息
        FileDetailInfoViewController *infoVC = [[FileDetailInfoViewController alloc] init];
        return infoVC;
    } else if (index == 1) {
        // 评论列表
        FileDetailCommentViewController *commentVC = [[FileDetailCommentViewController alloc] init];
        return commentVC;
    }
    return nil;
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"info: %@",info);
    
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    // .multipliedBy(9.0f/16.0f).with.priority(750)
    return CGRectMake(0, [UIScreen mainScreen].bounds.size.width/16*9, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.width*9/16);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, [UIScreen mainScreen].bounds.size.width*9/16, [UIScreen mainScreen].bounds.size.width, 44);
}

@end
