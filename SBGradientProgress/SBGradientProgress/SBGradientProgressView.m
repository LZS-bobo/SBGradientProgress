//
//  SBGradientProgressView.m
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/22.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "SBGradientProgressView.h"
#import "SBGradientProgress.h"

@interface SBGradientProgressView ()


@property (nonatomic, strong) SBGradientProgress *gradientProgress;

@end

@implementation SBGradientProgressView

- (SBGradientProgress *)gradientProgress
{
    if (!_gradientProgress) {
        _gradientProgress = [[SBGradientProgress alloc] init];
    }
    return _gradientProgress;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.gradientProgress.frame = CGRectMake(0, 0, 0, frame.size.height);
        [self addSubview:self.gradientProgress];
        self.hidenWhenFilled = YES;
    }
    return self;
}


#pragma mark - ---------setter--------
- (void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    if (hidden == YES) {
        self.gradientProgress.frame = CGRectMake(0, 0, 0, self.bounds.size.height);
    }
}

- (void)setPureColor:(UIColor *)pureColor
{
    _pureColor = pureColor;
    self.gradientProgress.pureColor = pureColor;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = MIN(1.0, fabs(progress));
    
    CGFloat width = self.bounds.size.width * _progress;
    NSTimeInterval duration = (width - self.gradientProgress.bounds.size.width) / self.bounds.size.width;
    
    if (_progress > 0) {
        self.alpha = 1.0;
        self.hidden = NO;
    }
    [UIView animateWithDuration:duration * 2 animations:^{
        self.gradientProgress.frame = CGRectMake(0, 0, width, self.bounds.size.height);
    } completion:^(BOOL finished) {
        if (_progress >= 1 && self.isHidenWhenFilled) {
            [UIView animateWithDuration:0.5 animations:^{
                    self.alpha = 0;

            } completion:^(BOOL finished) {
                self.gradientProgress.frame = CGRectMake(0, 0, 0, self.bounds.size.height);
            }];
        }
    }] ;
}


@end
