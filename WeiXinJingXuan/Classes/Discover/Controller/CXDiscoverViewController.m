//
//  CXDiscoverViewController.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXDiscoverViewController.h"
#import "CXUMSocial.h"


#define iconURL @"http://ww2.sinaimg.cn/large/006tNbRwgw1fao41fw526j30500503yk.jpg"
@interface CXDiscoverViewController () 

@end

@implementation CXDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CXBackgroundColor;
    self.navigationItem.title = @"发现";
    
    //测试
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(100, 100, 100, 50);
    shareButton.backgroundColor = [UIColor blackColor];
    [shareButton setTitle:@"分享应用" forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
}
- (void)share
{
    [[CXUMSocial defaultSocialManager] shareTopicWithTitle:@"分享标题" content:@"内容" image:iconURL url:@"www.baidu.com" completion:nil];
}


@end
