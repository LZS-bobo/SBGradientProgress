//
//  UINavigationBar+Item.m
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/23.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "UINavigationBar+Item.h"
#import <objc/runtime.h>
#import "SBGradientProgressView.h"

@implementation UINavigationBar (Item)


- (void)setSb_gradientProgress:(SBGradientProgressView *)sb_gradientProgress
{
    objc_setAssociatedObject(self, @"sb_gradientProgress", sb_gradientProgress, OBJC_ASSOCIATION_RETAIN);
}

- (SBGradientProgressView *)sb_gradientProgress
{
    SBGradientProgressView *progressView = objc_getAssociatedObject(self, @"sb_gradientProgress");
    if (progressView == nil) {
        progressView = [self creatGradientProgress];
    }
    return progressView;
}

- (SBGradientProgressView *)creatGradientProgress
{
    SBGradientProgressView *progressView = [[SBGradientProgressView alloc] init];
    progressView.frame = CGRectMake(0, self.bounds.size.height - (SBGradientProgressBottomMargin + SBGradientProgressHeight) , self.bounds.size.width, SBGradientProgressHeight);
    [self setSb_gradientProgress:progressView];
    [self addSubview:progressView];
    return progressView;
}

- (void)setSb_progress:(CGFloat)sb_progress
{
    if (!self.sb_gradientProgress) {
        [self creatGradientProgress];
    }
    self.sb_gradientProgress.progress = sb_progress;
}

- (CGFloat)sb_progress
{
    return self.sb_gradientProgress.progress;
}






@end
