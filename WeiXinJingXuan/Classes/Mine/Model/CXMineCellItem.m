//
//  CXMineCellItem.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/3.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXMineCellItem.h"

@implementation CXMineCellItem
+ (instancetype)itemWithTitle:(NSString *)title
{
#warning 这里一定要用self，不能用CXMineCellItem，因为子类也要调用！
    CXMineCellItem *item = [[self alloc] init];
    item.title = title;
    return item;
}
@end
