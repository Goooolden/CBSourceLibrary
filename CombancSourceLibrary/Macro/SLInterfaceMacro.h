//
//  InterfaceMacro.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/5.
//  Copyright © 2019 王楠. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef InterfaceMacro_h
#define InterfaceMacro_h

#define setObjectForKey(object) \
do { \
[dictionary setObject:object forKey:@#object]; \
} while (0)

#define setObjectForParameter(object) \
do { \
NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil]; \
NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; \
[paramDic setObject:str forKey:@"param"]; \
} while (0)

#define BaseUrl @"http://10.5.1.4"

#pragma mark - 公共库
//公共库列表网络请求
#define RootfloderListUrl [NSString stringWithFormat:@"%@/zyk/lib/rootFolder/phone.htm", BaseUrl]
NS_INLINE NSDictionary *RootfloderListParameter(NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//下一页，展开子节点
#define NextfloderUrl [NSString stringWithFormat:@"%@/zyk/lib/subfolders/phone.htm", BaseUrl]
NS_INLINE NSDictionary *NextfloderParameter(NSString *userName,NSString *parentId) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(parentId);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//创建新文件夹
#define CreatefloderURL [NSString stringWithFormat:@"%@/zyk/createFolder/phone.htm", BaseUrl]
/**
 @param id 选中的节点ID
 @param isParent 是否为父节点
 @param name 新建文件夹名称
 @param pId 0
 */
NS_INLINE NSDictionary *createFloderParameter(NSString *id, NSString *isParent, NSString *name, NSString *pId) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForKey(isParent);
    setObjectForKey(name);
    setObjectForKey(pId);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//删除文件夹或文件
#define DeleteFloderURL [NSString stringWithFormat:@"%@/zyk/delFolder/phone.htm", BaseUrl]
/**
 @param array [{"id":"25","type":"folder/file"}]type类型中folder代表删除的是文件夹，file代表删除的是文件
 */
NS_INLINE NSDictionary *deleteFloderParameter(NSArray *array) {
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForParameter(array);
    return paramDic.copy;
}

//移动操作
#define MoveFloderURL [NSString stringWithFormat:@"%@/zyk/move/to/phone.htm", BaseUrl]
/**
 @param folderId 目标文件夹id
 @param folderIds 被移动文件夹id(多个用逗号隔开)
 @param fileIds 被移动文件id(多个用逗号隔开)
 */
NS_INLINE NSDictionary *moveFloderParameter(NSString *folderId, NSString *folderIds, NSString *fileIds) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(folderId);
    setObjectForKey(folderIds);
    setObjectForKey(fileIds);
    setObjectForParameter(paramDic);
    return paramDic.copy;
}

//放入回收站
#define RecyclefloderURL [NSString stringWithFormat:@"%@/zyk/recycle/phone.htm", BaseUrl]
/**
 @param fileIds 文件ID(多个用逗号给开)
 @param folderIds 文件夹ID(多个用逗号隔开)
 */
NS_INLINE NSDictionary *recycleFloderParamter(NSString *fileIds, NSString *folderIds) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(fileIds);
    setObjectForKey(folderIds);
    setObjectForParameter(paramDic);
    return paramDic.copy;
}

#pragma mark - 网盘
//我的网盘根目录
#define PanRootfloderUrl [NSString stringWithFormat:@"%@/zyk/mobile/rootFolder.htm", BaseUrl]
NS_INLINE NSDictionary *PanRootfloderParameter(NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//我的网盘获取指定目录的文件和文件夹列表
#define PanNextFloderUrl [NSString stringWithFormat:@"%@/zyk/mobile/expandFolder.htm", BaseUrl]
NS_INLINE NSDictionary *PanNextFloderParameter(NSString *id) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#pragma mark - 公共库回收站
//回收站列表
#define PublicRecycleListURL [NSString stringWithFormat:@"%@/zyk/lib/listRecycle/phone.htm", BaseUrl]
/**
 @param userName 用户名
 @param page 当前页
 */
NS_INLINE NSDictionary *PublicRecycleListParam(NSString *userName,NSString *page) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(page);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//回收站删除
#define PublicRecycleDelURL [NSString stringWithFormat:@"%@/zyk/delRecycle/phone.htm", BaseUrl]
/**
 @param ids 多个id用逗号隔开(1,3,4)
 */
NS_INLINE NSDictionary *PublicRecycleDelParam(NSString *ids) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(ids);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//回收站还原
#define PublicRecycleRebackURL [NSString stringWithFormat:@"%@/zyk/reback/phone.htm", BaseUrl]
/**
 @param ids 多个id用逗号隔开(1,3,4)
 */
NS_INLINE NSDictionary *PublicRecycleRebackParam(NSString *ids) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(ids);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#pragma mark - 网盘回收站
//回收站列表
#define PanRecycleListURL [NSString stringWithFormat:@"%@/zyk/listRecycle/phone.htm", BaseUrl]
NS_INLINE NSDictionary *PanRecycleListParam(NSString *page, NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(page);
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//删除
#define PanRecycleDeleteURL [NSString stringWithFormat:@"%@/zyk/delRecycle/phone.htm", BaseUrl]
NS_INLINE NSDictionary *PanRecycleDeleteParam(NSString *ids) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(ids);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#pragma mark - 共享
//发出的共享
#define ShareSendURL [NSString stringWithFormat:@"%@/zyk/share/search/phone.htm", BaseUrl]
/**
 @param searchStr 文件名或文件夹名称
 @param userName 用户名
 */
NS_INLINE NSDictionary *ShareSendParam(NSString *searchStr, NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(searchStr);
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//收到的共享
#define ShareReciveURL [NSString stringWithFormat:@"%@/zyk/share/search/recive/phone.htm", BaseUrl]
/**
 @param searchStr 文件名或文件夹名称
 @param userName 用户名
 */
NS_INLINE NSDictionary *ShareReciveParam(NSString *searchStr, NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(searchStr);
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//删除共享
#define ShareDeleteURL [NSString stringWithFormat:@"%@/zyk/share/del/phone.htm", BaseUrl]
/**
 @param id 删除数据id号

 */
NS_INLINE NSDictionary *ShareDeleteParam(NSString *id) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#pragma mark - 收件箱发件箱管理
//发送收件箱
#define InboxSendURL [NSString stringWithFormat:@"%@/zyk/inbox/search/phone.htm", BaseUrl]
/**
 @param userName 用户名
 @param searchStr 查询参数，文件夹名称
 @param page 当前页
 @param pageSize 每页大小
 */
NS_INLINE NSDictionary *InboxSendParam(NSString *userName, NSString *searchStr, NSString *page, NSString *pageSize) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(searchStr);
    setObjectForKey(page);
    setObjectForKey(pageSize);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//接收收件箱
#define InboxReceiveURL [NSString stringWithFormat:@"%@/zyk/inbox/search/recive/phone.htm", BaseUrl]
/**
 @param userName 用户名
 @param searchStr 查询参数，文件夹名称
 @param page 当前页
 @param pageSize 每页大小
 */
NS_INLINE NSDictionary *InboxReceiveParam(NSString *userName, NSString *searchStr, NSString *page, NSString *pageSize) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(searchStr);
    setObjectForKey(page);
    setObjectForKey(pageSize);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//删除发送文件夹
#define InboxDeleteURL [NSString stringWithFormat:@"%@/inbox/del/phone", BaseUrl]
NS_INLINE NSDictionary *InboxDeleteParam(NSString *id) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//上传
#define InboxUploadURL [NSString stringWithFormat:@"%@/un/inbox/upload/phone", BaseUrl]
/**
 @param file 上传的文件对象
 @param inboxId 文件ID
 */
NS_INLINE NSDictionary *InboxUploadParam(NSString *file, NSString *inboxId) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(file);
    setObjectForKey(inboxId);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//查看列表
#define InboxListURL [NSString stringWithFormat:@"%@/un/inbox/upload/phone", BaseUrl]

//删除文件
#define InboxDeletefileURL [NSString stringWithFormat:@"%@/del/phone.htm", BaseUrl]

#pragma mark - 收藏
//收藏列表
#define CollectListURL [NSString stringWithFormat:@"%@/zyk/collect/search/phone.htm", BaseUrl]
/**
 @param searchStr 查询参数，文件名
 @param userName 用户名
 @param page 当前页
 @param pageSize 每页数
 */
NS_INLINE NSDictionary *CollectListParam(NSString *searchStr, NSString *userName, NSString *page, NSString *pageSize) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(searchStr);
    setObjectForKey(userName);
    setObjectForKey(page);
    setObjectForKey(pageSize);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//查看详情
#define CollectionDetailURL [NSString stringWithFormat:@"%@/zyk/un/view/preview/phone.htm", BaseUrl]
NS_INLINE NSDictionary *CollectionDetailParam(NSString *id, NSString *userName) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForKey(userName);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#endif /* InterfaceMacro_h */
