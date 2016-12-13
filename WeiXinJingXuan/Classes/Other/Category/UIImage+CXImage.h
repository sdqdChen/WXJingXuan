//
//  UIImage+CXImage.h
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/4.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CXImage)
/*
 * 返回不被渲染的图片
 */
+ (UIImage *)imageOriginalWithName:(NSString *)name;
/*
 * 返回裁剪的圆形图片
 */
+ (UIImage *)imageCircledWithimage:(UIImage *)image;
@end
