//
//  ViewController.m
//  SBGradientProgress
//
//  Created by 罗壮燊 on 2016/12/22.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "ViewController.h"
#import "SBGradientProgress.h"
#import "SBGradientProgressView.h"
#import "UINavigationBar+Item.h"

@interface ViewController ()


@property (nonatomic, strong) SBGradientProgressView *sb;

@property (nonatomic, assign) CGFloat progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    SBGradientProgressView *sb1 = [[SBGradientProgressView alloc] initWithFrame:CGRectMake(0, 150, 300, 10)];

    [self.view addSubview:sb1];
    sb1.progress = 1.0;
    sb1.hidenWhenFilled = NO;
    self.sb = sb1;
    
    _progress = 0.1;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)nilPureColorBtnClick:(id)sender {
    self.navigationController.navigationBar.sb_gradientProgress.pureColor = nil;
}
- (IBAction)pureColorBtnClick:(id)sender {
    self.navigationController.navigationBar.sb_gradientProgress.pureColor = [UIColor blackColor];
}
- (IBAction)addProgressBtnClick:(id)sender {
    _progress *= 2;
    
    if (_progress > 1 && _progress != 2) {
        _progress = 1;
    } else if(_progress == 2 ){
        _progress = 0.1;
    }
    self.sb.progress = _progress;
    
    self.navigationController.navigationBar.sb_progress = _progress;
    self.navigationController.navigationBar.sb_gradientProgress.hidenWhenFilled = YES;
}
- (IBAction)pushBtnClick:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self.navigationController pushViewController:[sb instantiateViewControllerWithIdentifier:@"ViewController"] animated:YES];
}




@end
