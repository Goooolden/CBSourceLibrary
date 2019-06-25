//
//  PublicRequest.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/5.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RequestSuccess)(id json);
typedef void(^RequestFailed)(NSError *error);

@interface PublicRequest : NSObject

//公共库网络请求
+ (void)requsetRootFolderListWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;

//下一页
+ (void)requestNextFolderListWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;

//创建新文件夹
+ (void)requestCreatefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除文件夹或者文件
+ (void)requestDeletefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;

//移动文件夹或者文件
+ (void)requestMovefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;

//放入回收站
+ (void)requestRecyclefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed;
@end

NS_ASSUME_NONNULL_END
