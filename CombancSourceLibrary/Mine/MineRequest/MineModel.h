//
//  MineModel.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/7.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineModel : NSObject

@end

@interface RecycleModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *delUser;
@property (nonatomic, copy) NSString *recycleTime;

@end

@interface ShareModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileCount;
@property (nonatomic, copy) NSString *folderCount;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *viewTimes;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *shareTime;

@end

@interface CollectionModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *fileId;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *fileSize;
@property (nonatomic, copy) NSString *uploadUser;
@property (nonatomic, copy) NSString *usable;
@property (nonatomic, copy) NSString *fileIcon;

@end

@interface InboxModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *uploadCount;
@property (nonatomic, copy) NSString *code;

@end

NS_ASSUME_NONNULL_END
