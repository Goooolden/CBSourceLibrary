//
//  RootPanModel.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/6.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootPanModel : NSObject

@property (nonatomic, copy) NSString *id;        //节点ID号
@property (nonatomic, copy) NSString *name;      //节点名称
@property (nonatomic, assign) BOOL isParent;     //是否父节点
@property (nonatomic, assign) BOOL open;         //树形结构默认是否展开
@property (nonatomic, copy) NSString *postUrl;   //展开一个文件夹，展示里面的文件
@property (nonatomic, copy) NSString *createTime;//创建时间

//@property (nonatomic, copy) NSString *id;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *postUrl;
//@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *uploadUser;   //上传人
@property (nonatomic, copy) NSString *type;         //文件类型(11pdf 12word 13excel 14ppt 15txt  2视频 3mp3 4图片)
@property (nonatomic, copy) NSString *pId;          //父节点ID
@property (nonatomic, copy) NSString *size;         //文件大小
@property (nonatomic, assign) BOOL check;           //true通过审核是否审核通过，审核通过在公共库可查
@property (nonatomic, copy) NSString *isNew;
@property (nonatomic, copy) NSString *praise;
@property (nonatomic, copy) NSString *img;          //展示文件小图
@property (nonatomic, copy) NSString *downLoadNum;
@property (nonatomic, copy) NSString *praiseNum;
@property (nonatomic, copy) NSString *commentNum;
@property (nonatomic, copy) NSString *viewNum;
@property (nonatomic, copy) NSString *scoreNum;

@end

NS_ASSUME_NONNULL_END
