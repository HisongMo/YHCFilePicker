//
//  YHCFilePickerCell.m
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//

#import "YHCFilePickerCell.h"
#import "YHCFilePicker.h"

#define width_icon 30

@implementation YHCFilePickerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    //图标
    _icon = [[UIImageView alloc] init];
    _icon.clipsToBounds = YES;
    _icon.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_icon];
    //删除
    _deleteBtn = [[UIButton alloc] init];
    [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"YHCSources.bundle/deleteButton" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    [_deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_deleteBtn];
    //名字
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    _nameLabel.numberOfLines = 0;
    [self.contentView addSubview:_nameLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.width.height.mas_offset(width_icon);
    }];
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(0);
        make.right.equalTo(self).offset(-10);
        make.width.height.mas_offset(20);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.centerY.equalTo(self).offset(0);
        make.right.equalTo(self.deleteBtn.mas_left).offset(10);
    }];
}

- (void)deleteAction
{
    if(self.deleteFileBlock)
    {
        self.deleteFileBlock(_cellIndexPath);
    }
}

@end
