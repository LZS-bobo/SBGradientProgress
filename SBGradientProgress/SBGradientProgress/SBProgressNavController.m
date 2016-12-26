//
//  SBProgressNavController.m
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/23.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "SBProgressNavController.h"
#import "UINavigationBar+Item.h"
#import "SBGradientProgressView.h"

@interface SBProgressNavController ()<UINavigationBarDelegate>

@end

@implementation SBProgressNavController



- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor colorWithRed:0 green:122/255.0 blue:255/255.0 alpha:1];
}

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







@end
