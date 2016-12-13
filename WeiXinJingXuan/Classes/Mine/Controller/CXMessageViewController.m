//
//  CXMessageViewController.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/6.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXMessageViewController.h"
#import "CXTestViewController.h"

@interface CXMessageViewController ()

@end

@implementation CXMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"消息通知";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 40, 40);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)next
{
    CXTestViewController *vc = [[CXTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
