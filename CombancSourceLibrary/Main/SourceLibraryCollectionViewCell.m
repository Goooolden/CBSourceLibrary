//
//  SourceLibraryCollectionViewCell.m
//  CombancSourceLibrary
//
//  Created by Golden on 2019/7/19.
//  Copyright © 2019 王楠. All rights reserved.
//

#import "SourceLibraryCollectionViewCell.h"
#import "UIColor+HexColor.h"

@interface SourceLibraryCollectionViewCell ()

@property (nonatomic,strong) UIImageView *imageV;

@property (nonatomic,strong) UILabel *titleLab;

@end

@implementation SourceLibraryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.imageV = [[UIImageView alloc] init];
    self.imageV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.imageV];
    
    self.titleLab = [[UILabel alloc]init];
    self.titleLab.textColor = [UIColor colorWithHex:@"#38383d"];
    self.titleLab.font = [UIFont systemFontOfSize:16];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLab];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(70);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        make.left.right.equalTo(self.contentView);
    }];
}

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    self.imageV.image = [UIImage imageNamed:_imageName];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLab.text = title;
}

@end
