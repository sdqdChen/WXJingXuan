//
//  CXMineCellItem.h
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/3.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^operationBlock)();

@interface CXMineCellItem : NSObject
@property (nonatomic, strong) NSString *title;
//保存每一行cell的功能
@property (nonatomic, strong) operationBlock operation;
//缓存大小
@property (nonatomic, assign) NSInteger cacheSize;

+ (instancetype)itemWithTitle:(NSString *)title;
@end
