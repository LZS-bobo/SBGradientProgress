//
//  SBGradientProgressView.h
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/22.
//  Copyright © 2016年 bobo. All rights reserved.
//  带进度的渐变动画View

#import <UIKit/UIKit.h>

@interface SBGradientProgressView : UIView

///进度(0--1)
@property (nonatomic, assign) CGFloat progress;

///纯色进度条 pureColor = nil 的时候为彩色渐变
@property (nonatomic, strong) UIColor *pureColor;

///当进度完成时隐藏进度条
@property (nonatomic, assign, getter=isHidenWhenFilled) BOOL hidenWhenFilled;

@end
