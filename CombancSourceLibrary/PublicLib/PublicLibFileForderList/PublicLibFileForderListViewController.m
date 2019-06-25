//
//  PublicLibFileForderListViewController.m
//  CombancSourceLibrary
//
//  Created by 王楠 on 2018/9/17.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "PublicLibFileForderListViewController.h"
#import "FileDetailRootViewController.h"
#import "FileForderListCell.h"
#import "FileListCell.h"
#import "DealFileForderView.h"
#import "PublicRequest.h"
#import "RootPanModel.h"

#import "SourceLibBaseNavigationController.h"

NSString *const PublicLibFileForderListCellId = @"PublicLibFileForderListCellId";

@interface PublicLibFileForderListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView; /**< tableView*/
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *selectIndexPathArray;   //选择的cell
@property (nonatomic, strong) NSMutableDictionary *selectedDictionary;//选中的id及type

@end

@implementation PublicLibFileForderListViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公共库";
    
    self.selectIndexPathArray = [[NSMutableArray alloc]init];
    
    // 文件操作View
    DealFileForderView *dealForderView = [[DealFileForderView alloc] init];
    dealForderView.iconArray = @[@"new_normal", @"upload_normal", @"search_normal", @"more_normal"];
    CGFloat height = CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame);
    height = 0;
    dealForderView.frame = CGRectMake(0, height, self.view.bounds.size.width, 50);
    dealForderView.block = ^(NSUInteger index) {
        if (index == 0) {
            //新建
            [self createNewFloder];
        }else if (index == 1) {
            //上传
        }else if (index == 2) {
            //搜索
        }else if (index == 3) {
            //操作
            [self showAlertController];
        }
    };
    [self.view addSubview:dealForderView];
    
    _dataArray = [[NSMutableArray alloc]init];
    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(dealForderView.mas_bottom);
    }];
    
    if (self.next) {
        [self requestNextRootfloderList:self.parentId];
    }else {
        [self requestRootfloderList];
    }
}

#pragma mark - Setter

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_myTableView registerClass:[FileForderListCell class] forCellReuseIdentifier:PublicLibFileForderListCellId];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileForderListCell *cell = [tableView dequeueReusableCellWithIdentifier:PublicLibFileForderListCellId forIndexPath:indexPath];
    RootPanModel *model = self.dataArray[indexPath.row];
    cell.forderNameLabel.text = model.name;
    cell.timeLabel.text = model.createTime;
    
    cell.iconImgView.image = [UIImage imageNamed:@"SourceLibrary.bundle/Folder"];
    if (model.type.length > 0) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/zyk/%@",BaseUrl,model.img]];
        [cell.iconImgView sd_setImageWithURL:url];
        cell.fileSizeLabel.text = [NSString stringWithFormat:@"%@KB",model.size];
    }
    
    [cell.chooseBtn setImage:[UIImage imageNamed:@"SourceLibrary.bundle/cb_normal"] forState:UIControlStateNormal];
    if ([self.selectIndexPathArray containsObject:indexPath]) {
        [cell.chooseBtn setImage:[UIImage imageNamed:@"SourceLibrary.bundle/cb_pressed"] forState:UIControlStateNormal];
    }
    cell.chooseBtn.tag = indexPath.row;
    [cell.chooseBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SourceLibBaseNavigationController *baseNC = (SourceLibBaseNavigationController *)self.navigationController;
    baseNC.backBtnImgWhite = YES;
    
    RootPanModel *model = self.dataArray[indexPath.row];
    if (model.type.length > 0) {
        //进入详情界面
        FileDetailRootViewController *fileDetailVC = [[FileDetailRootViewController alloc]init];
        [self.navigationController pushViewController:fileDetailVC animated:YES];
    }else {
        //进入下一页面
        PublicLibFileForderListViewController *nextListVC = [[PublicLibFileForderListViewController alloc] init];
        nextListVC.next = YES;
        nextListVC.parentId = model.id;
        [self.navigationController pushViewController:nextListVC animated:YES];
    }
}

//cell按钮点击事件
- (void)chooseBtnClicked:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    if ([self.selectIndexPathArray containsObject:indexPath]) {
        [self.selectIndexPathArray removeObject:indexPath];
    }else {
        [self.selectIndexPathArray addObject:indexPath];
    }
    [self.myTableView reloadData];
}

#pragma mark - 操作列表
//创建新文件夹
- (void)createNewFloder {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"创建文件夹" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"新建文件夹";
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *envirnmentNameTextField = alertController.textFields.firstObject;
        if (envirnmentNameTextField.text.length == 0) {
            [CombancHUD showInfoMessage:@"请输入文件夹名字"];
        }else {
            [self requestNewFloderWithName:envirnmentNameTextField.text];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

//其他操作
- (void)showAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    UIAlertAction *copy = [UIAlertAction actionWithTitle:@"复制" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击复制");
    }];
    
    UIAlertAction *move = [UIAlertAction actionWithTitle:@"移动" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击复制");
    }];
    
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self requesetDeleteFloderOrFile:nil type:nil];
    }];
    
    UIAlertAction *download = [UIAlertAction actionWithTitle:@"下载" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击复制");
    }];
    
    UIAlertAction *preview = [UIAlertAction actionWithTitle:@"预览" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击复制");
    }];
    
    UIAlertAction *remove = [UIAlertAction actionWithTitle:@"放入回收站" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self requestRecycleFloder:nil floderIds:nil];
    }];
    
    UIAlertAction *clear = [UIAlertAction actionWithTitle:@"清理失效记录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击复制");
    }];
    
    [alertController addAction:copy];
    [alertController addAction:move];
    [alertController addAction:delete];
    [alertController addAction:download];
    [alertController addAction:preview];
    [alertController addAction:remove];
    [alertController addAction:clear];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 网络请求
//获取首页第一层目录
- (void)requestRootfloderList {
    [PublicRequest requsetRootFolderListWithParam:RootfloderListParameter(@"admin") success:^(id  _Nonnull json) {
        self.dataArray = [self deleteOpenFloderWithArray:json];
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

//根据目录ID展开下层目录
- (void)requestNextRootfloderList:(NSString *)parentId {
    [PublicRequest requestNextFolderListWithParam:NextfloderParameter(@"admin", parentId) success:^(id  _Nonnull json) {
        self.dataArray = [self deleteOpenFloderWithArray:json];
        [self.myTableView reloadData];
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

//将返回的数据进行过滤
- (NSMutableArray *)deleteOpenFloderWithArray:(NSMutableArray *)array {
    NSMutableArray *nextArray = [NSMutableArray arrayWithArray:array];
    for (RootPanModel *model in array) {
        if (model.open) {
            //获取节点id，便于创建新文件夹
            self.parentId = model.id;
            [nextArray removeObject:model];
        }
    }
    return nextArray;
}

//创建新的文件夹
- (void)requestNewFloderWithName:(NSString *)newfloderName {
    [PublicRequest requestCreatefloderWithParam:createFloderParameter(self.parentId, @"0", newfloderName, @"0") success:^(id  _Nonnull json) {
        if ([json[@"result"] isEqual:@(1)]) {
            [CombancHUD showSuccessMessage:@"创建成功"];
            if (self.next) {
                [self requestNextRootfloderList:self.parentId];
            }else {
                [self requestRootfloderList];
            }
        }
    } failed:^(NSError * _Nonnull error) {

    }];
}

//删除文件夹或者文件
- (void)requesetDeleteFloderOrFile:(NSString *)floderId type:(NSString *)type {
    
    if (self.selectIndexPathArray.count == 0) {
        [CombancHUD showInfoMessage:@"请选择删除文件"];
        return;
    }
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectIndexPathArray) {
        RootPanModel *model = self.dataArray[indexPath.row];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:model.id forKey:@"id"];
        [dic setObject:(model.type.length > 0 ? @"file" : @"floder") forKey:@"type"];
        [array addObject:dic];
    }
    
    [PublicRequest requestDeletefloderWithParam:deleteFloderParameter(array) success:^(id  _Nonnull json) {
        if ([json[@"result"] isEqual:@"1"]) {
            [CombancHUD showSuccessMessage:@"删除成功"];
            if (self.next) {
                [self requestNextRootfloderList:self.parentId];
            }else {
                [self requestRootfloderList];
            }
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

//移动文件或者文件夹
- (void)requestMoveFloderOrFile:(NSString *)floderId folderIds:(NSString *)floderIds fileIds:(NSString *)fileIds {
    [PublicRequest requestMovefloderWithParam:moveFloderParameter(floderId, floderIds, fileIds) success:^(id  _Nonnull json) {
        if ([json[@"result"] isEqual:@"1"]) {
            [CombancHUD showSuccessMessage:@"移动成功"];
            if (self.next) {
                [self requestNextRootfloderList:self.parentId];
            }else {
                [self requestRootfloderList];
            }
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

//放入回收站
- (void)requestRecycleFloder:(NSString *)fileIds floderIds:(NSString *)floderIds {
    
    if (self.selectIndexPathArray.count == 0) {
        [CombancHUD showInfoMessage:@"请选择文件"];
        return;
    }
    
    NSMutableArray *fileIdsArray = [[NSMutableArray alloc]init];
    NSMutableArray *floderIdsArray = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectIndexPathArray) {
        RootPanModel *model = self.selectIndexPathArray[indexPath.row];
        if (model.type.length > 0) {
            [fileIdsArray addObject:model.id];
        }else {
            [floderIdsArray addObject:model.id];
        }
    }

    NSLog(@"recycleFloderParamt---%@",recycleFloderParamter([fileIdsArray componentsJoinedByString:@","], [floderIdsArray componentsJoinedByString:@","]));
    
//    [PublicRequest requestRecyclefloderWithParam:recycleFloderParamter(fileIdsArray, floderIdsArray) success:^(id  _Nonnull json) {
//        if ([json[@"result"] isEqual:@(1)]) {
//            [CombancHUD showSuccessMessage:@"放入回收站成功"];
//            if (self.next) {
//                [self requestNextRootfloderList:self.parentId];
//            }else {
//                [self requestRootfloderList];
//            }
//        }
//    } failed:^(NSError * _Nonnull error) {
//
//    }];
}



@end
