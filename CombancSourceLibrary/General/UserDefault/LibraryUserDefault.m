//
//  LibraryUserDefault.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/6.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "LibraryUserDefault.h"

static LibraryUserDefault *libaryUserDefault;

@implementation LibraryUserDefault

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libaryUserDefault = [[LibraryUserDefault alloc] init];
    });
    return libaryUserDefault;
}

@end
