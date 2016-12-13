//
//  CXMineViewController.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/3.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXMineViewController.h"
#import "CXHeadLoginView.h"
#import "CXMineCellItem.h"
#import "CXButtonCellItem.h"
#import "CXLabelCellItem.h"
#import "CXArrowCellItem.h"
#import "CXMineViewCell.h"
#import "CXMessageViewController.h"
#import "CXOpinionViewController.h"
#import "CXAboutUsViewController.h"
#import <SVProgressHUD.h>
#import "CXUMSocial.h"

#define iconURL @"http://ww2.sinaimg.cn/large/006tNbRwgw1fao41fw526j30500503yk.jpg"
@interface CXMineViewController () <UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray *cellItems;
@property (nonatomic, assign) NSInteger cacheSize;
@end

@implementation CXMineViewController
#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableView
    [self setupTableView];
    //设置headerView
    [self setupHeaderView];
    //添加数据模型
    [self addCellItem];
    //计算缓存
    [CXFileTool getFileSize:CachesPath completion:^(NSInteger cacheSize) {
        _cacheSize = cacheSize;
        [self.tableView reloadData];
    }];
}
/*
 * 设置tableView
 */
- (void)setupTableView
{
    self.navigationController.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(-CXStatusBarH, 0, 0, 0);
}
/*
 * 设置headerView
 */
- (void)setupHeaderView
{
    CXHeadLoginView *headerView = [[CXHeadLoginView alloc] init];
    headerView.frame = CGRectMake(0, 0, CXScreenW, 350 * CXScaleH);
    self.tableView.tableHeaderView = headerView;
}
/*
 * 添加数据模型
 */
- (void)addCellItem
{
    CXButtonCellItem *nightItem = [CXButtonCellItem itemWithTitle:@"夜间模式"];
    CXLabelCellItem *cacheItem = [CXLabelCellItem itemWithTitle:@"清除缓存"];
    cacheItem.operation = ^(){
        [self clearCache];
    };
    CXArrowCellItem *messageItem = [CXArrowCellItem itemWithTitle:@"消息通知"];
    messageItem.descVc = [CXMessageViewController class];
    CXArrowCellItem *shareItem = [CXArrowCellItem itemWithTitle:@"分享给好友"];
    shareItem.operation = ^(){
        [self shareAppWithFriends];
    };
    CXArrowCellItem *opinionItem = [CXArrowCellItem itemWithTitle:@"意见反馈"];
    opinionItem.descVc = [CXOpinionViewController class];
    CXArrowCellItem *aboutItem = [CXArrowCellItem itemWithTitle:@"关于我们"];
    aboutItem.descVc = [CXAboutUsViewController class];
    self.cellItems = @[nightItem, cacheItem, messageItem, shareItem, opinionItem, aboutItem];
}
#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CXMineViewCell *cell = [CXMineViewCell cellWithTableView:tableView];
    CXMineCellItem *item = self.cellItems[indexPath.row];
    cell.item = item;
    if ([item isKindOfClass:[CXLabelCellItem class]]) {
        cell.cacheSize = self.cacheSize;
        if (cell.cacheSize == 0) {
            cell.userInteractionEnabled = NO;
        } else {
            cell.userInteractionEnabled = YES;
        }
    }
    return cell;
}
#pragma mark - tableView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXMineCellItem *item = self.cellItems[indexPath.row];
    //不用跳转控制器的操作
    if (item.operation) {
        item.operation();
        return;
    }
    //跳转控制器的操作
    if ([item isKindOfClass:[CXArrowCellItem class]]) {
        //跳转界面
        CXArrowCellItem *arrowItem = (CXArrowCellItem *)item;
        UIViewController *vc = [[arrowItem.descVc alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - 清除缓存
- (void)clearCache
{
    [CXFileTool removeDirectoryPath:CachesPath];
    self.cacheSize = 0;
    [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"清除缓存成功"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}
#pragma mark - 分享给好友
- (void)shareAppWithFriends
{
    [[CXUMSocial defaultSocialManager] shareAppWithTitle:@"分享标题" content:@"分享内容" image:iconURL url:@"www.baidu.com" completion:nil];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
@end
