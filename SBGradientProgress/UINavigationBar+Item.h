//
//  UINavigationBar+Item.h
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/23.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SBGradientProgressView;

#define SBGradientProgressHeight 3
#define SBGradientProgressBottomMargin 1

@interface UINavigationBar (Item)

///渐变的view（设置进度会自动创建）
@property (nonatomic, strong) SBGradientProgressView *sb_gradientProgress;
///进度
@property (nonatomic, assign) CGFloat sb_progress;


@end
