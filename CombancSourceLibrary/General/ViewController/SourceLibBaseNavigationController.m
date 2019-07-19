//
//  SourceLibBaseNavigationController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "SourceLibBaseNavigationController.h"

@interface SourceLibBaseNavigationController ()

@end

@implementation SourceLibBaseNavigationController


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        NSString *backBtnImgName = @"leftNavBack";
        if (self.backBtnImgWhite) {
            backBtnImgName = @"leftNavBackWhite";
        }else {
            if ([viewController isKindOfClass:NSClassFromString(@"MWPhotoBrowser")]) {
                // 如果是图片浏览器，那么返回导航按钮显示白色图片
                backBtnImgName = @"leftNavBackWhite";
            }else {
                backBtnImgName = @"leftNavBack";
            }
        }
        NSString *titleStr = self.backBtnTitle? self.backBtnTitle : @"";
        viewController.navigationItem.leftBarButtonItem = [self customUIBarButtonItemImage:backBtnImgName higlightedImage:backBtnImgName title:titleStr target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    self.backBtnTitle = @"";
    [self popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)customUIBarButtonItemImage:(NSString *)image higlightedImage:(NSString *)higlightedImage title:(NSString *)title target:(id)target action:(SEL)action {
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 2.设置按钮背景图片
    UIImage *normal = [UIImage imageNamed:image];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    // 3.设置按钮的尺寸
    btn.bounds = CGRectMake(0, 0, 70, 50);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    if ([title isEqualToString:@""]) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    }else {
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    // 4.监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 5.返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
