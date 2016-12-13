//
//  CXNumberTextField.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/12.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXNumberTextField.h"

@implementation CXNumberTextField
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.placeholderColor = [UIColor lightGrayColor];
    self.tintColor = CXBlueColor;
}

@end
