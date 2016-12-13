//
//  UIImage+CXImage.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/11/4.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "UIImage+CXImage.h"

@implementation UIImage (CXImage)
+ (UIImage *)imageOriginalWithName:(NSString *)name
{
    UIImage *imageOriginal = [UIImage imageNamed:name];
    return [imageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
+ (UIImage *)imageCircledWithimage:(UIImage *)image
{
    //1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.描述裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //3.进行裁剪
    [path addClip];
    //4.画图片
    [image drawAtPoint:CGPointZero];
    //5.取出图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
