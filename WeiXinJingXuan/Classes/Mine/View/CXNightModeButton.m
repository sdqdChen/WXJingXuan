//
//  CXSwitchButton.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/28.
//  Copyright © 2016年 陈晓. All rights reserved.
//
//  我的界面-夜间模式按钮

#import "CXNightModeButton.h"

@implementation CXNightModeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"switch_bk"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"switch_close"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"switch_open"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(nightModeClick) forControlEvents:UIControlEventTouchUpInside];
        [self sizeToFit];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [UIView animateWithDuration:0.15 animations:^{
        if (self.selected == YES) {
            self.imageView.cx_x += 12;
        } else {
            self.imageView.cx_x = 17;
        }
    }];
}
/*
 * 夜间模式点击
 */
- (void)nightModeClick
{
    self.selected = !self.selected;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (self.selected) {
        [UIView animateWithDuration:0.3 animations:^{
            window.backgroundColor = [UIColor blackColor];
            window.alpha = 0.4;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            window.backgroundColor = [UIColor whiteColor];
            window.alpha = 1;
        }];
    }
}
@end
