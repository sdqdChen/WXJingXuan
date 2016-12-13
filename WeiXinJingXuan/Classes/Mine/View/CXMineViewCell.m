//
//  CXMineViewCell.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/27.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXMineViewCell.h"
#import "CXMineCellItem.h"
#import "CXLabelCellItem.h"
#import "CXArrowCellItem.h"
#import "CXButtonCellItem.h"
#import "CXNightModeButton.h"

@interface CXMineViewCell ()
//分割线
@property (nonatomic, strong) UIView *separatorView;
//夜间模式按钮
@property (nonatomic, strong) CXNightModeButton *nightModeButton;
//缓存文本
@property (nonatomic, strong) UILabel *cacheLabel;

@property (nonatomic, copy) NSString *cacheText;
@end

@implementation CXMineViewCell
#pragma mark - 懒加载
- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = CXBackgroundColor;
    }
    return _separatorView;
}
- (CXNightModeButton *)nightModeButton
{
    if (!_nightModeButton) {
        _nightModeButton = [CXNightModeButton buttonWithType:UIButtonTypeCustom];
    }
    return _nightModeButton;
}
- (UILabel *)cacheLabel
{
    if (!_cacheLabel) {
        _cacheLabel = [[UILabel alloc] init];
        _cacheLabel.font = self.textLabel.font;
        _cacheLabel.textColor = self.textLabel.textColor;
    }
    return _cacheLabel;
}
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.textLabel.textColor = [UIColor darkGrayColor];
        //分割线
        [self addSubview:self.separatorView];
    }
    return self;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    CXMineViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CXMineViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}
#pragma mark - 设置cell内容
- (void)setItem:(CXMineCellItem *)item
{
    _item = item;
    self.textLabel.text = item.title;
    //设置accessory
    [self setupAccessory];
}
- (void)setupAccessory
{
    if ([_item isKindOfClass:[CXButtonCellItem class]]) {
        self.accessoryView = self.nightModeButton;
    } else if ([_item isKindOfClass:[CXLabelCellItem class]]) {
        self.accessoryView = self.cacheLabel;
    } else if ([_item isKindOfClass:[CXArrowCellItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _separatorView.frame = CGRectMake(CXSeparatorMargin, self.cx_height, self.cx_width - CXSeparatorMargin * 2, 1);
    if ([_item isKindOfClass:[CXButtonCellItem class]]) {
        CGRect accFrame = self.accessoryView.frame;
        accFrame.origin.x += CXSeparatorMargin;
        self.accessoryView.frame = accFrame;
    }
}
#pragma mark - 清除缓存
/*
 * 处理缓存数字显示
 */
- (void)setCacheSize:(NSInteger)cacheSize
{
    _cacheSize = cacheSize;
    NSString *sizeStr = self.cacheText;
    if (cacheSize / 1000 / 1000 > 0) { // MB
        sizeStr = [NSString stringWithFormat:@"%.1fMB", cacheSize / 1000.0 / 1000.0];
    } else if (cacheSize / 1000 > 0) { // KB
        sizeStr = [NSString stringWithFormat:@"%.1fKB",  cacheSize / 1000.0];
    } else if (cacheSize > 0) { // B
        sizeStr = [NSString stringWithFormat:@"%.ldB",  cacheSize];
    } else if (cacheSize == 0) {
        sizeStr = @"空";
    }
    self.cacheLabel.text = sizeStr;
    [self.cacheLabel sizeToFit];
}
@end
