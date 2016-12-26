//
//  SBGradientProgress.m
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/22.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "SBGradientProgress.h"

@interface SBGradientProgress ()

///蒙板
@property (nonatomic, strong) CAGradientLayer *masklayer;

@end

@implementation SBGradientProgress



/**
 水平方向上 透明度0-->1的渐变图层
 */
- (CAGradientLayer *)masklayer
{
    if (!_masklayer) {
        _masklayer = [CAGradientLayer layer];
        _masklayer.startPoint = CGPointMake(0.0, 0.5);
        _masklayer.endPoint = CGPointMake(1.0, 0.5);
        _masklayer.colors = @[(id)[UIColor colorWithWhite:1.0 alpha:0].CGColor,
                              (id)[UIColor colorWithWhite:1.0 alpha:1].CGColor];
    }
    return _masklayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CAGradientLayer *layer = (id)[self layer];
        layer.cornerRadius = self.bounds.size.height / 2.0;
        
        //渐变方向为水平  --->
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];
        
        layer.mask = self.masklayer;
        
        [self startAnimation];
        
    }
    
    return self;
}


/**
 设置初始渐变颜色
 */
- (void)gradientColors
{
    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *colors = [NSMutableArray array];
    for (NSInteger deg = 0; deg <= 360; deg += 5) {
        
        UIColor *color;
        color = [UIColor colorWithHue:1.0 * deg / 360.0
                           saturation:1.0
                           brightness:1.0
                                alpha:1.0];
        [colors addObject:(id)[color CGColor]];
    }
    [layer setColors:[NSArray arrayWithArray:colors]];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.masklayer.frame = self.bounds;
    self.layer.cornerRadius = self.bounds.size.height / 2.0;
}

+ (Class)layerClass
{
    return [CAGradientLayer class];
}


/**
 纯色进度条
 */
- (void)setPureColor:(UIColor *)pureColor
{
    _pureColor = pureColor;
    if (pureColor == nil) {
        
        [self startAnimation];
    } else {
        CAGradientLayer *layer = (id)[self layer];
        layer.colors = @[(id)pureColor.CGColor,(id)pureColor.CGColor];
        [self.layer removeAllAnimations];
    }
}


/**
 乾坤大挪移（最后一个放到前面）
 */
- (NSArray *)shiftColors:(NSArray *)colors {
    
    NSMutableArray *mutable = [colors mutableCopy];
    id last = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:last atIndex:0];
    
    return [NSArray arrayWithArray:mutable];
}



/**
 动画的values <NSArray *<color>>
 */
- (NSArray *)animValues
{
    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *values = [NSMutableArray array];
    NSArray *colors = nil;
    for (NSInteger deg = 0; deg <= 360; deg += 5) {
        if (values.count) {
            colors = values[deg / 5 - 1];
        } else {
            colors = layer.colors;
        }
        [values addObject:[self shiftColors:colors]];
    }
    
    return values;
}

- (void)startAnimation
{
    //设置初始渐变值
    [self gradientColors];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"colors"];
    anim.values = [self animValues];
    [anim setDuration:1];
    [anim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    anim.repeatCount = MAXFLOAT;
    [self.layer addAnimation:anim forKey:nil];
}

@end
