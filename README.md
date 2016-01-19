# BLEPersonViewController
模仿微博个人详情页面

###Screenshot
![](http://a.picphotos.baidu.com/album/s%3D680%3Bq%3D90/sign=f04c4b2792cad1c8d4bbff2f4f051634/279759ee3d6d55fb72f92d2e6a224f4a20a4ddff.jpg)

###Objective-C

* 创建一个继承自`"BLEPersonViewController.h"`的控制器作为主控制器。

```
@interface BLETestViewController : BLEPersonViewController
```

* 创建继承自`BLETableViewController.h`作为子控制器，并设置title。

```
@interface BLEPersonTableViewController : BLETableViewController
```

* 将创建的子控制器添加到主控制器的子控制器

```
[self addChildViewController:personVc];
```




###Property

```
@property (nonatomic)UIImage *personIconImage;

@property (nonatomic)UIImage *personCardImage;


```

###Usage


```   
self.title = @"个人主页";

self.personCardImage = [UIImage imageNamed:@"png"];

self.personIconImage = [UIImage imageNamed:@"icon_base"];

BLEPersonTableViewController *personVc = [[BLEPersonTableViewController alloc]init];
personVc.title = @"个人";
[self addChildViewController:personVc];

BLEWeiboTableViewController *weiboVc = [[BLEWeiboTableViewController alloc]init];
weiboVc.title = @"微博";
[self addChildViewController:weiboVc];
```


	
