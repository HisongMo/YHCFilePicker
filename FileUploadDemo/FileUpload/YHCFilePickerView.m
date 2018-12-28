//
//  YHCFilePickerView.m
//  FileUploadDemo
//
//  Created by 萤火虫 on 2018/12/28.
//  Copyright © 2018年 萤火虫. All rights reserved.
//

#import "YHCFilePickerView.h"
#import "YHCFilePickerCell.h"
#import "YHCFilePicker.h"
#import "YHCFileModel.h"

@interface YHCFilePickerView()<UITableViewDelegate,UITableViewDataSource,UIDocumentPickerDelegate>

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSMutableArray *fileArray;
///文件类型数组
@property (nonatomic, strong)NSArray *documentTypes;

@property (nonatomic, strong)UIButton *addBtn;

@end

@implementation YHCFilePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    _fileArray = [NSMutableArray array];
    _documentTypes = @[@"public.content", @"public.text", @"public.source-code ", @"public.image", @"public.audiovisual-content", @"com.adobe.pdf", @"com.apple.keynote.key", @"com.microsoft.word.doc", @"com.microsoft.excel.xls", @"com.microsoft.powerpoint.ppt"];
    _addBtn = [[UIButton alloc]init];
    [_addBtn setTitle:@"上传文件" forState:UIControlStateNormal];
    [_addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addFileAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(15);
    }];
    
    _tableview = [[UITableView alloc]init];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.tableFooterView = [UIView new];
    _tableview.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableview.bounces = NO;
    [self addSubview:_tableview];
    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self).offset(0);
        make.top.equalTo(self.addBtn.mas_bottom).offset(10);
    }];
}

- (void)addFileAction
{
    UIDocumentPickerViewController *documentPickerViewController = [[UIDocumentPickerViewController alloc]initWithDocumentTypes:_documentTypes inMode:UIDocumentPickerModeOpen];
    documentPickerViewController.delegate = self;
    [[self viewController] presentViewController:documentPickerViewController animated:YES completion:nil];
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fileArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"YHCFilePickerCell";
    YHCFilePickerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[YHCFilePickerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.nameLabel.font = [UIFont systemFontOfSize:15];
    YHCFileModel *model = self.fileArray[indexPath.row];
    cell.nameLabel.text = model.fileName;
    cell.cellIndexPath = indexPath;
    cell.icon.image = [UIImage imageNamed:@"YHCSources.bundle/dentry_type_cell_excel.png"];
    cell.deleteFileBlock = ^(NSIndexPath * _Nonnull cellIndexPath) {
        NSMutableArray *leftArr = [NSMutableArray array];
        for(int i = 0;i < cellIndexPath.row; ++i)
        {
            [leftArr addObject:self.fileArray[i]];
        }
        for(int i = (int)cellIndexPath.row + 1;i < self.fileArray.count; ++i)
        {
            [leftArr addObject:self.fileArray[i]];
        }
        [self.fileArray removeAllObjects];
        [self.fileArray addObjectsFromArray:leftArr];
        [self.tableview reloadData];
        if(self.pushfileListBlock)
        {
            self.pushfileListBlock(self.fileArray);
        }
    };
    return cell;
}

#pragma mark - UIDocumentPickerDelegate
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls
{
    NSString *fileUrl = [[urls lastObject] absoluteString];
    NSURL *fileURL = [NSURL URLWithString:fileUrl];
    fileUrl = [fileUrl stringByRemovingPercentEncoding];
    
    NSArray *nameArr = [fileUrl componentsSeparatedByString:@"/"];
    NSString *fileName = [nameArr lastObject];
    if(fileName.length <= 0)
    {
        fileName = nameArr[nameArr.count - 2];
    }
    YHCFileModel *model = [[YHCFileModel alloc]init];
    model.url = fileURL;
    model.fileName = fileName;
    [self.fileArray addObject:model];
    [self.tableview reloadData];
    if(self.pushfileListBlock)
    {
        self.pushfileListBlock(self.fileArray);
    }
}

@end
