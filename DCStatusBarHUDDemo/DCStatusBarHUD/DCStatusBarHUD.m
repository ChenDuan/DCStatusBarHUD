//
//  DCStatusBarHUD.m
//  DCStatusBarHUDDemo
//
//  Created by duanchenvip on 15/10/27.
//  Copyright © 2015年 duanchenvip. All rights reserved.
//

#import "DCStatusBarHUD.h"

@implementation DCStatusBarHUD

static NSTimer *timer_;
static UIWindow *window_;
//出现时间逗留时间
static CGFloat const DCStayDuration = 1.75;
//出现和隐藏动画时间
static CGFloat const DCAnimationDuration = 0.25;
//图文间距
static CGFloat const margin = 10.0;


#pragma mark - 私有方法

+ (void)setUpText:(NSString *)text image:(UIImage *)image {
    CGRect windowF = [UIApplication sharedApplication].statusBarFrame;
    window_ = [[UIWindow alloc] init];
    window_.frame = windowF;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor lightGrayColor];
    window_.alpha = 0.4;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    [button setTitle:text forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, margin, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, margin);
    }
    CGRect beginWindowF = windowF;
    beginWindowF.origin.y = - beginWindowF.size.height;
    window_.frame = beginWindowF;
    [UIView animateWithDuration:DCAnimationDuration animations:^{
        CGRect endWindowF = windowF;
        endWindowF.origin.y = 2 * endWindowF.size.height;
        window_.frame = endWindowF;
    } completion:nil];
    
}


#pragma mark - 公共方法

+ (void)showLoading:(NSString *)text {
    [self setUpText:text image:nil];
    CGRect windowF = window_.frame;
    UIButton *button = window_.subviews.lastObject;
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    [button.titleLabel sizeToFit];
    CGFloat loadingCenterX = (windowF.size.width - button.titleLabel.frame.size.width) *0.5  - 20;
    loadingView.center = CGPointMake(loadingCenterX, windowF.size.height * 0.5);
    [window_ addSubview:loadingView];
    [timer_ invalidate];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:DCStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showText:(NSString *)text image:(UIImage *)image {
    [self setUpText:text image:image];
    [timer_ invalidate];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:DCStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showText:(NSString *)text imageName:(NSString *)imageName {
    [self showText:text image:[UIImage imageNamed:imageName]];
}

+ (void)showText:(NSString *)text {
    [self showText:text image:nil];
}

+ (void)showSuccess:(NSString *)text {
    [self showText:text imageName:@"DCStatusBar.bundle/success"];
}

+ (void)showError:(NSString *)text {
    [self showText:text imageName:@"DCStatusBar.bundle/error"];
}

+ (void)hide {
    [timer_ invalidate];
    timer_ = nil;
    [UIView animateWithDuration:DCAnimationDuration animations:^{
        CGRect beginWindowF = window_.frame;
        beginWindowF.origin.y = - beginWindowF.size.height;
        window_.frame = beginWindowF;
    } completion:^(BOOL finished) {
        if (timer_ == nil) {
            window_ = nil;
        }
    }];
}

@end
