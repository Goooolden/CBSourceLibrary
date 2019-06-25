//
//  PublicRequest.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/5.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "PublicRequest.h"
#import "RootPanModel.h"
#import "MJExtension.h"

@implementation PublicRequest

+ (void)requsetRootFolderListWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:RootfloderListUrl headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [RootPanModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestNextFolderListWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:NextfloderUrl headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *dataArray = [RootPanModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestCreatefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:CreatefloderURL headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            success(json);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestDeletefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:DeleteFloderURL headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            success(json);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestMovefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:MoveFloderURL headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            success(json);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)requestRecyclefloderWithParam:(NSDictionary *)paramDic success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:RecyclefloderURL headers:nil params:paramDic success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            success(json);
        }
    } failure:^(NSError *error) {
        
    }];
}

@end
