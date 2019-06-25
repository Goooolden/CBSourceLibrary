//
//  MineRequest.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/7.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "MineRequest.h"
#import "MineModel.h"
#import "MJExtension.h"

@implementation MineRequest

#pragma mark - 公共库回收站

+ (void)requestPublicRecycleListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PublicRecycleListURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [RecycleModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"resJo"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}

+ (void)requestPublicRecycleDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PublicRecycleDelURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestPublicRecycleRebackWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PublicRecycleRebackURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 网盘回收站

+ (void)requestPanRecycleListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PanRecycleListURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [RecycleModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}

+ (void)requestPanRecycleDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PanRecycleDeleteURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 分享

+ (void)requestShareSendWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:ShareSendURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [ShareModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestShareReciveWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:ShareReciveURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [ShareModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestShareDelWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:ShareDeleteURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 收藏

+ (void)requestCollectListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:CollectListURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [CollectionModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}

+ (void)requestCollectDetailWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:CollectionDetailURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 收件箱、发件箱管理

+ (void)requestInboxReceiveWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxReceiveURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [InboxModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestInboxSendWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxSendURL headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [InboxModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestInboxListWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxListURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestInboxDeleteWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxDeleteURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}



+ (void)requestInboxUploadWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxUploadURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestInboxDelfailWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:InboxDeletefileURL headers:nil params:param success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}
@end
