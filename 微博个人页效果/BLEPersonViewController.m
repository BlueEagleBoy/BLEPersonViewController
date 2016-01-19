//
//  BLEPersonViewController.m
//  微博个人页效果
//
//  Created by BlueEagleBoy on 16/1/18.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "BLEPersonViewController.h"
#import "BLETableViewController.h"

@interface BLEPersonViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *personCardView;
@property (weak, nonatomic) IBOutlet UIImageView *personIconView;
@property (weak, nonatomic) IBOutlet UIView *tabBar;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cardViewHeightConstraint;

@property (nonatomic)UILabel *titleLabel;
@property (nonatomic)UIButton *selectedBtn;


@end

@implementation BLEPersonViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:@"BLEPersonViewController" bundle:nibBundleOrNil]) {
      
    }
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.personIconView.layer.cornerRadius = self.personIconView.frame.size.width * 0.5;
    [self.personIconView.layer masksToBounds];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        self.personCardView.image = self.personCardImage;
        self.personIconView.image = self.personIconImage;
        
        [self setupNavigationBar];
        
        [self setupTabbar];
        
        [self setupChildViewController];  
        
    });
    
   
    
}

//设置导航栏
- (void)setupNavigationBar {
    
    //设置导航栏的背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏下的阴影
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    //设置导航栏的titleView
    UILabel *label = [[UILabel alloc]init];
    self.titleLabel = label;
    label.font = [UIFont boldSystemFontOfSize:18];
    label.text = self.title;
    
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    [label sizeToFit];
    self.navigationItem.titleView = label;
    
 
}

//设置控制器
- (void)setupChildViewController {
    
    //遍历子控制器 设置自控制器的样式
    for ( BLETableViewController *tableViewController in self.childViewControllers) {
        //将约束赋值给tableViewController
        tableViewController.headHCons = self.cardViewHeightConstraint;
        
        //将TitleView复制给TableViewController
        tableViewController.titleLabel = self.titleLabel;
  
    }
 
}

//设置tabBar样式
- (void)setupTabbar {
    
    for (UIViewController *childVc in self.childViewControllers) {
        //根据子控制器 添加tabBar的button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置btn的tag
        btn.tag = _tabBar.subviews.count;
        
        [btn setTitle:childVc.title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchDown];
    
        //默认选中第一个按钮
        if (btn.tag == 0) {
            
            [self didClickBtn:btn];
            btn.selected = YES;
        }
        
        [self.tabBar addSubview:btn];
        
    }
   
}

- (void)didClickBtn:(UIButton *)sender {
    
    if (sender == self.selectedBtn) {
        return;
    }
    
    //删除上一个内容视图
    UITableView *lastView = (UITableView *)[self.childViewControllers[_selectedBtn.tag] view];
    
    [lastView removeFromSuperview];
    
    //设置选项视图的按钮点击样式
    self.selectedBtn.selected = NO;
    sender.selected = YES;
    self.selectedBtn = sender;

    
    //切换内容显示
    UITableViewController *tableVc = (UITableViewController *)self.childViewControllers[sender.tag];
    
    tableVc.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview: tableVc.view];
    
    //设置tableView的contentOffset与上一个视图一致
    tableVc.tableView.contentOffset = lastView.contentOffset;
 
}



//给tabBar的子button进行布局
- (void)viewDidLayoutSubviews {
 
    [super viewDidLayoutSubviews];
    
    CGFloat optionBtnW = [UIScreen mainScreen].bounds.size.width / self.tabBar.subviews.count;
    
    CGFloat optionBtnH = self.tabBar.bounds.size.height;
    
    for (int i = 0; i < self.tabBar.subviews.count; i++) {
        
        CGFloat optionBtnX = i * optionBtnW;
        
        UIButton *optionBtn = self.tabBar.subviews[i];
        
        optionBtn.frame = CGRectMake(optionBtnX, 0, optionBtnW, optionBtnH);
  
    }
    
}


@end
