//
//  CXMineViewCell.h
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//
//  我的界面-自定义cell

#import <UIKit/UIKit.h>

@class CXMineCellItem;
@interface CXMineViewCell : UITableViewCell
@property (nonatomic, strong) CXMineCellItem *item;
//缓存大小
@property (nonatomic, assign) NSInteger cacheSize;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
