//
//  YHCFilePickerView.h
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHCFileModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHCFilePickerView : UIView

@property (nonatomic, copy)void (^pushfileListBlock)(NSArray<YHCFileModel *> *list);

@end

NS_ASSUME_NONNULL_END
