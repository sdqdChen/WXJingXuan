//
//  CXHeadLoginView.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/3.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXHeadLoginView.h"
#import "CXLoginButton.h"

@interface CXHeadLoginView ()
@property (nonatomic, weak) CXLoginButton *loginbutton;
@property (nonatomic, weak) UIView *separatorView;
@end

@implementation CXHeadLoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //登录按钮
        CXLoginButton *loginbutton = [CXLoginButton buttonWithType:UIButtonTypeCustom];
        self.loginbutton = loginbutton;
        [self addSubview:loginbutton];
        //分割线
        UIView *separatorView = [[UIView alloc] init];
        self.separatorView = separatorView;
        separatorView.backgroundColor = CXBackgroundColor;
        [self addSubview:separatorView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.loginbutton.center = CGPointMake(self.cx_width * 0.5, self.cx_height * 0.5);
    self.separatorView.frame = CGRectMake(CXSeparatorMargin, self.cx_height, self.cx_width - CXSeparatorMargin * 2, 1);
}

@end
