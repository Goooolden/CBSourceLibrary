//
//  MineRequest.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/7.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RequestSuccess)(id json);
typedef void(^RequestFailed)(NSError *error);

@interface MineRequest : NSObject

#pragma mark - 公共库回收站
//列表
+ (void)requestPublicRecycleListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除
+ (void)requestPublicRecycleDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//还原
+ (void)requestPublicRecycleRebackWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

#pragma mark - 网盘回收站
//列表
+ (void)requestPanRecycleListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除
+ (void)requestPanRecycleDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

#pragma mark - 共享
//发出的共享
+ (void)requestShareSendWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//收到的共享
+ (void)requestShareReciveWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除共享
+ (void)requestShareDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

#pragma mark - 收藏
//收藏列表
+ (void)requestCollectListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//查看收藏信息详情
+ (void)requestCollectDetailWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

#pragma mark - 收件箱、发件箱管理
//发送收件箱
+ (void)requestInboxSendWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//接收收件箱
+ (void)requestInboxReceiveWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除发送文件夹
+ (void)requestInboxDeleteWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//上传
+ (void)requestInboxUploadWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//查看列表
+ (void)requestInboxListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

//删除文件
+ (void)requestInboxDelfailWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed;

@end

NS_ASSUME_NONNULL_END
