//
//  DealFileForderView.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/13.
//  Copyright © 2018年 王楠. All rights reserved.
//  包含新建、上传、搜索、更多处理的对文件操作的View

#import "DealFileForderView.h"

#define DealFileForderBtnTag 7890

@implementation DealFileForderView

- (instancetype)init {
    self = [super init];
    self.backgroundColor = [UIColor colorWithRed:239/255.f green:239/255.f blue:244/255.f alpha:1];
    return self;
}

- (void)setIconArray:(NSArray *)iconArray {
    
    _iconArray = iconArray;
    for (NSUInteger i = 0; i < iconArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        CGFloat width = [UIScreen mainScreen].bounds.size.width/iconArray.count;
        btn.frame = CGRectMake(i*width, 0, width, 50);
        [btn setImage:[UIImage imageNamed:iconArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = DealFileForderBtnTag + i;
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)sender {
    NSUInteger index = sender.tag - DealFileForderBtnTag;
    if (self.block) {
        self.block(index);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
