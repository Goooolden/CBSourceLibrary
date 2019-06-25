//
//  SharePageViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/9.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "SharePageViewController.h"
#import "ShareListViewController.h"

@interface SharePageViewController ()<WMPageControllerDelegate,WMPageControllerDataSource>

@end

@implementation SharePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init {
    if (self = [super init]) {
        self.pageAnimatable = NO;
        self.delegate = self;
        self.dataSource = self;
        self.titleSizeSelected = 16;
        self.titleSizeNormal = 16;
        self.menuViewStyle = WMMenuViewStyleLine;
        // self.titleColorSelected = [UIColor colorWithHex:@"#007aff"];
        // self.titleColorNormal = [UIColor colorWithHex:@"#38383d"];
        self.titleFontName = @"PingFangSC-Medium";
        self.menuItemWidth = 80.0f;
        self.progressWidth = 80.0f;
    }
    return self;
}

- (NSArray *)titles {
    return @[@"我共享的",@"我收到的"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    ShareListViewController *listVC = [[ShareListViewController alloc]init];
    return listVC;
}

#pragma mark - TableViewDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50);
}

@end
