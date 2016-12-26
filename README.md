# SBGradientProgress
[渐变进度条] (http://www.jianshu.com/p/605e577d702c)
###一行代码设置UINavigationBar渐变进度条
##self.navigationController.navigationBar.sb_progress = 0.8;
###要实现一行代码实现渐变进度条需要以下操作
```
导入UINavigationBar+Item 
在UINavigationController 中实现下面两个方法
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item
{
    navigationBar.sb_gradientProgress.hidden = YES;
    return YES;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    navigationBar.sb_gradientProgress.hidden = YES;
    return YES;
}
```
###SBGradientProgressView的api
```
@interface SBGradientProgressView : UIView

///进度(0--1)
@property (nonatomic, assign) CGFloat progress;

///纯色进度条 pureColor = nil 的时候为彩色渐变
@property (nonatomic, strong) UIColor *pureColor;

///当进度完成时隐藏进度条
@property (nonatomic, assign, getter=isHidenWhenFilled) BOOL hidenWhenFilled;

@end
```
<img src="https://github.com/LZS-bobo/SBGradientProgress/blob/master/SBGradientProgress/SBGradientProgress/2016-12-26%2011.44.00.gif" width = "300" alt="图片名称" align=center />
