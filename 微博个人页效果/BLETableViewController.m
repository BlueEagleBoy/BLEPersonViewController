//
//  BLEPersonTableViewController.m
//  微博个人页效果
//
//  Created by BlueEagleBoy on 16/1/18.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "BLETableViewController.h"
#import "UIImage+Image.h"
#define  headH 200
#define  headMinH 64
#define tabBarH 44

@interface BLETableViewController ()

@property (nonatomic)CGFloat lastContentOffsetY;

@end

@implementation BLETableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //记录tableView的偏移量
    self.lastContentOffsetY = -(headH  + tabBarH);

    self.tableView.contentInset = UIEdgeInsetsMake(headH + tabBarH, 0, 0, 0);

}

//滚动的代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //计算上下拖动的距离
    CGFloat delta =  self.lastContentOffsetY - scrollView.contentOffset.y;
    
    CGFloat height = headH + delta;
    
    //判断是否达到了最小高度
    if (height < headMinH) {
        
        height = headMinH;
    }
    
    //给headView的高度约束重新赋值
    self.headHCons.constant = height;
    //设置透明度
    CGFloat alpha = delta/(headMinH - headH);
    
    if (alpha >= 1) {
        
        alpha = 0.99;
    }

    //定义根据color去初始化一个图片 调用分类方法根据颜色生成图片
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha] ];
    self.titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha];
    //重新设置导航栏的背景图片
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}


@end
