//
//  YHCFilePicker.h
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//
#import "Masonry/Masonry.h"
#import "YYCategories.h"
#define  kWidth_YHC  [UIScreen mainScreen].bounds.size.width
#define  kHeight_YHC [UIScreen mainScreen].bounds.size.height
#define  kBounds_YHC [UIScreen mainScreen].bounds
#define  ThemeColor_YHC [UIColor colorWithRed:0xf2/255.0 green:0xf4/255.0 blue:0xf9/255.0 alpha:1]r

#define kRatio_YHC kWidth_YHC/375.0

/** cell上删除按钮的宽 */
#define kDeleteButtonWidth_YHC kRatio_YHC * 18

//日志输出
#ifdef DEBUG
#define LLLog(...) NSLog(__VA_ARGS__)
#else
#define LLLog(...)

#endif /* YHCFilePicker_h */
