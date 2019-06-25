//
//  NetPanRequest.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/6.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RequestSuccess)(id json);
typedef void(^RequestFailed)(NSError *error);

@interface NetPanRequest : NSObject

//我的网盘根目录
+ (void)NetPanRequestRootfloderWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//我的网盘获取指定目录的文件和文件夹列表
+ (void)NetPanRequestNextFloderWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

@end

NS_ASSUME_NONNULL_END
