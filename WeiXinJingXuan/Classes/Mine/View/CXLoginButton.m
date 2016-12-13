//
//  CXLoginButton.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXLoginButton.h"
#import "CXLoginViewController.h"

@implementation CXLoginButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"loginButton"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self sizeToFit];
    }
    return self;
}
/*
 * 取消按钮高亮
 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}
/*
 * 点击登录
 */
- (void)loginButtonClick
{
    CXLoginViewController *loginVc = [[CXLoginViewController alloc] init];
    [self.window.rootViewController presentViewController:loginVc animated:YES completion:nil];
}
@end
