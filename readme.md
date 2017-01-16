XZDoodleView
====
## 简介
最近看了微信图片编辑功能,觉得挺好玩的,就研究了下,说白了就是在图片上面画线,有两种实现思路,一种是贝赛尔曲线`UIBezierPath`,另外一个就是`Core Graphics`,两者都能达到想要的效果。用UIBezierPath写了个小demo,具体代码可以查看源码,如果想使用也可以通过`CocoaPods`导入,在`Podfile`里面加上如下代码`pod 'XZDoodleView'`,并执行`pod install`。
## 使用说明
在使用的地方加上如下代码:

```Objective-C
	DoodleConfig *config = [DoodleConfig config];
	config.image = [UIImage imageNamed:@"ocean"];
	config.drewColor = [UIColor yellowColor];
	XZDoodleView *doodleView = [[XZDoodleView alloc] initWithFrame:self.view.bounds config:config];
	[self.view addSubview:doodleView];

```
