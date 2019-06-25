//
//  PublicLibFileForderListViewController.h
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/17.
//  Copyright © 2018年 王楠. All rights reserved.
//  公共库

#import <UIKit/UIKit.h>
#import "SourceLibBaseViewController.h"

@interface PublicLibFileForderListViewController : SourceLibBaseViewController

@property (nonatomic, assign) BOOL next;
@property (nonatomic, copy) NSString *parentId;

@end
