//
//  LibraryUserDefault.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/6.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootPanModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LibraryUserDefault : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, strong) RootPanModel *rootPanModel;

@end

NS_ASSUME_NONNULL_END
