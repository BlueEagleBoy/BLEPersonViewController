//
//  ViewController.m
//  微博个人页效果
//
//  Created by BlueEagleBoy on 16/1/17.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "BLETestViewController.h"

#import "BLEPersonTableViewController.h"
#import "BLEWeiboTableViewController.h"



@interface BLETestViewController()

@end

@implementation BLETestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"个人主页";
    
    self.personCardImage = [UIImage imageNamed:@"png"];
    
    self.personIconImage = [UIImage imageNamed:@"icon_base"];
    
    BLEPersonTableViewController *personVc = [[BLEPersonTableViewController alloc]init];
    personVc.title = @"个人";
    [self addChildViewController:personVc];
    
    BLEWeiboTableViewController *weiboVc = [[BLEWeiboTableViewController alloc]init];
    weiboVc.title = @"微博";
    [self addChildViewController:weiboVc];

    

}





@end
