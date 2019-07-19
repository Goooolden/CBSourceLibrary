//
//  SourceLibBaseNavigationController.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SourceLibBaseNavigationController : UINavigationController

@property (nonatomic, strong) NSString *backBtnTitle; /**< 返回按钮的名*/
@property (nonatomic, assign) BOOL backBtnImgWhite; /**< 返回按钮是否是白色*/

@end
