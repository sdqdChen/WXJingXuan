//
//  CXTabBarController.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXTabBarController.h"
#import "CXNavigationController.h"
#import "CXHomeViewController.h"
#import "CXDiscoverViewController.h"
#import "CXFriendTrendsViewController.h"
#import "CXMineViewController.h"
#import "CXTabBar.h"

@interface CXTabBarController ()

@end

@implementation CXTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    //添加4个自控制器
    [self setupChildViewControllers];
    //替换系统的tabBar
    CXTabBar *tabBar = [[CXTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
}
/**
 * 设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes
{
    //普通状态的文字颜色
    NSMutableDictionary *normalAttr = [[NSMutableDictionary alloc] init];
    normalAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    //选中状态的文字颜色
    NSMutableDictionary *selectedAttr = [[NSMutableDictionary alloc] init];
    selectedAttr[NSForegroundColorAttributeName] = CXBlueColor;
    //全局设置文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}
/*
 * 添加所有的控制器
 */
- (void)setupChildViewControllers
{
    //首页
    [self setupOneChildViewController:[[CXHomeViewController alloc] init] title:@"首页" image:@"tabBar_recommand_icon" selectedImage:@"tabBar_recommand_icon_click"];
    //发现
    [self setupOneChildViewController:[[CXDiscoverViewController alloc] init] title:@"发现" image:@"tabBar_search_icon" selectedImage:@"tabBar_search_icon_click"];
    //关注
    [self setupOneChildViewController:[[CXFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_follow_icon" selectedImage:@"tabBar_follow_icon_click"];
    //我的
    [self setupOneChildViewController:[[CXMineViewController alloc] init] title:@"我的" image:@"tabBar_mine_icon" selectedImage:@"tabBar_mine_icon_click"];
}
/*
 * 添加一个控制器
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    CXNavigationController *nav = [[CXNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}

@end
