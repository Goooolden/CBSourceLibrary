//
//  MainViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/6/25.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "MainViewController.h"
#import "SourceLibBaseNavigationController.h"
#import "PublicLibFileForderListViewController.h"
#import "NetPanFileForderListViewController.h"
#import "SLMineListViewController.h"
#import <UIImage+Extend.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self jumpToMainVC];
}

- (void)jumpToMainVC {
    NSArray *normalImage = @[@"SourceLibrary.bundle/tabbar_LibPub_normal", @"SourceLibrary.bundle/tabbar_SkyDrive_normal", @"SourceLibrary.bundle/tabbar_My_normal"];
    NSArray *selectImage = @[@"SourceLibrary.bundle/tabbar_LibPub_focus", @"SourceLibrary.bundle/tabbar_SkyDrive_focus", @"SourceLibrary.bundle/tabbar_My_focus"];
    NSArray *vcClass = @[@"PublicLibFileForderListViewController", @"NetPanFileForderListViewController", @"SLMineListViewController"];
    NSArray *titleArray = @[@"公共库", @"网盘", @"我的"];
    NSMutableArray *allArray = [NSMutableArray array];
    for (int i = 0; i < titleArray.count; i++) {
        Class cla = NSClassFromString(vcClass[i]);
        UIViewController *vc = [[cla alloc] init];
        vc.navigationItem.title = titleArray[i];
        [vc.tabBarItem setTitle:titleArray[i]];
        [vc.tabBarItem setImage:[[UIImage imageNamed:normalImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        SourceLibBaseNavigationController *nav = [[SourceLibBaseNavigationController alloc] initWithRootViewController:vc];
        [allArray addObject:nav];
    }
    // 设置navigationBar样式
    [self setUpNavigationBarAppearance];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = allArray;
    [UIApplication sharedApplication].delegate.window.rootViewController = tabController;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    NSDictionary *textAttributes = nil;
    // backgroundImage = [UIImage imageNamed:@"navigationBar_BG"];
    textAttributes = @{
                       NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                       NSForegroundColorAttributeName: [UIColor whiteColor],
                       };
    UIImage *img = [UIImage imageWithColor:[UIColor colorWithRed:56/255.f green:56/255.f blue:61/255.f alpha:1]];
    navigationBarAppearance.translucent = NO;
    [navigationBarAppearance setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end
