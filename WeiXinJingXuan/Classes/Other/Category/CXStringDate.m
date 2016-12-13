//
//  CXStringDate.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/8.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXStringDate.h"

@implementation CXStringDate
+ (NSString *)cx_stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}
@end
