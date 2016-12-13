//
//  CXTabBar.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXTabBar.h"

@interface CXTabBar ()
@property (nonatomic, weak) UIView *separatorView;
@end

@implementation CXTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置tabBar背景颜色
        self.barTintColor = [UIColor whiteColor];
        //tabBar添加一条分隔线
        UIView *separatorView = [[UIView alloc] init];
        separatorView.backgroundColor = CXBackgroundColor;
        [self addSubview:separatorView];
        self.separatorView = separatorView;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.separatorView.frame = CGRectMake(0, 0, self.cx_width, 1);
}
@end
