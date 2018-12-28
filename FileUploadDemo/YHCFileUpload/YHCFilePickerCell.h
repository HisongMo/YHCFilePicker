//
//  YHCFilePickerCell.h
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHCFilePickerCell : UITableViewCell

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong) NSIndexPath *cellIndexPath;
@property (nonatomic, copy)void (^deleteFileBlock)(NSIndexPath *cellIndexPath);

@end

NS_ASSUME_NONNULL_END
