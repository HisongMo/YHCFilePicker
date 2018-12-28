//
//  ViewController.m
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//

#import "ViewController.h"
#import "YHCFilePickerView.h"
#import "YHCFilePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YHCFilePickerView *filePicker = [[YHCFilePickerView alloc]initWithFrame:CGRectMake(0, 40, kWidth_YHC, kHeight_YHC - 100)];
    [self.view addSubview:filePicker];
    filePicker.pushfileListBlock = ^(NSArray<YHCFileModel *> * _Nonnull list) {
        NSArray *arr = list;
    };
}


@end
