//
//  UIImage+Image.m
//  微博个人页效果
//
//  Created by BlueEagleBoy on 16/1/17.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    //描述一个矩形
    CGRect rect = CGRectMake(0, 0, 1, 1);
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    
    //渲染上下文
    CGContextFillRect(ctx, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;

}

@end
