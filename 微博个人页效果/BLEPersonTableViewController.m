//
//  BLEPersonTableViewController.m
//  微博个人页效果
//
//  Created by BlueEagleBoy on 16/1/18.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "BLEPersonTableViewController.h"
#define BLETableViewCellId  @"cell_id"

@interface BLEPersonTableViewController ()

@end

@implementation BLEPersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册tableViewCell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:BLETableViewCellId];
}

////#pragma mark 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BLETableViewCellId];
    
    cell.backgroundColor = [UIColor redColor];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
//
}

@end
