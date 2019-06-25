//
//  NetPanRequest.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/6.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "NetPanRequest.h"
#import "RootPanModel.h"
#import "MJExtension.h"

@implementation NetPanRequest

+ (void)NetPanRequestRootfloderWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PanRootfloderUrl headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSMutableArray *dataArray = [RootPanModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)NetPanRequestNextFloderWithParam:(NSDictionary *)param success:(RequestSuccess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:PanNextFloderUrl headers:nil params:param success:^(id json) {
        if ([json[@"result"] isEqual:@(1)]) {
            NSArray *jsonDataArray = json[@"data"];
            NSMutableArray *fileDataArray = [RootPanModel mj_objectArrayWithKeyValuesArray:[jsonDataArray firstObject][@"fileData"]];
            NSMutableArray *nodesArray = [RootPanModel mj_objectArrayWithKeyValuesArray:[jsonDataArray lastObject][@"zNodes"]];
            [fileDataArray addObjectsFromArray:nodesArray];
            success(fileDataArray);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
