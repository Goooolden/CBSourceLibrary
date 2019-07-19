//
//  MainViewController.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/6/25.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "SourceLibraryViewController.h"
#import "SourceLibBaseNavigationController.h"
#import "PublicLibFileForderListViewController.h"
#import "NetPanFileForderListViewController.h"
#import "SLMineListViewController.h"
#import "SourceLibraryCollectionViewCell.h"
#import <UIImage+Extend.h>

static NSString *cellID = @"HomeCellID";

@interface SourceLibraryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy)   NSArray *titleArr;

@end

@implementation SourceLibraryViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 13;
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 56)/3, (SCREEN_WIDTH-56)/3 * 120 / 105);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsMake(48, 15, 0, 15);
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = RGBA(239, 239, 243, 1);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled  = YES;
        if (@available(iOS 10.0, *)) {
            _collectionView.prefetchingEnabled = NO;
        }
    }
    return _collectionView;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@{@"imageName":@"SourceLibrary.bundle/repository_Entrance_Publictreasury_ico",@"title":@"公共库"},
                      @{@"imageName":@"SourceLibrary.bundle/repository_Entrance_SkyDrive_ico",@"title":@"网盘"},
                      @{@"imageName":@"SourceLibrary.bundle/repository_Entrance_Myresources_ico",@"title":@"我的"},];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.title = @"课堂考勤";
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[SourceLibraryCollectionViewCell class] forCellWithReuseIdentifier:cellID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SourceLibraryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imageName = self.titleArr[indexPath.row][@"imageName"];
    cell.title     = self.titleArr[indexPath.row][@"title"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        PublicLibFileForderListViewController *fordeListVC = [[PublicLibFileForderListViewController alloc]init];
        [self.navigationController pushViewController:fordeListVC animated:YES];
    }else if (indexPath.row == 1) {
        NetPanFileForderListViewController *panVC = [[NetPanFileForderListViewController alloc]init];
        [self.navigationController pushViewController:panVC animated:YES];
    }else if(indexPath.row == 2) {
        SLMineListViewController *mineVC = [[SLMineListViewController alloc]init];
        [self.navigationController pushViewController:mineVC animated:YES];
    }
}

#if 0
- (void)jumpToMainVC {
    NSArray *normalImage = @[@"tabbar_LibPub_normal", @"tabbar_SkyDrive_normal", @"tabbar_My_normal"];
    NSArray *selectImage = @[@"tabbar_LibPub_focus", @"tabbar_SkyDrive_focus", @"tabbar_My_focus"];
    NSArray *vcClass = @[@"PublicLibFileForderListViewController", @"NetPanFileForderListViewController", @"MineListViewController"];
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
//     backgroundImage = [UIImage imageNamed:@"navigationBar_BG"];
    textAttributes = @{
                       NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                       NSForegroundColorAttributeName: [UIColor whiteColor],
                       };
    UIImage *img = [UIImage imageWithColor:[UIColor colorWithRed:56/255.f green:56/255.f blue:61/255.f alpha:1]];
    navigationBarAppearance.translucent = NO;
    [navigationBarAppearance setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}
#endif

@end
