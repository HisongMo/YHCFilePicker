# YHCFilePicker
iOS实现文件上传功能
通过iCloud实现iOS端的上传文件功能

## 使用方法
1.导入头文件
```
#import "YHCFilePickerView.h"
```
2.初始化
```
YHCFilePickerView *filePicker = [[YHCFilePickerView alloc]initWithFrame:CGRectMake(0, 40, kWidth_YHC, kHeight_YHC - 100)];
[self.view addSubview:filePicker];
```
3.接收返回的文件数组
```
filePicker.pushfileListBlock = ^(NSArray<YHCFileModel *> * _Nonnull list) {
    NSArray *arr = list;
};
```

## 效果如下
![效果](https://github.com/Thered-key/YHCFilePicker/blob/master/Files/Simulator%20Screen%20Shot%20-%20iPhone%20XS%20Max%20-%202018-12-28%20at%2016.24.51.png)

