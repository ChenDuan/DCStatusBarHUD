//
//  ViewController.m
//  DCStatusBarHUDDemo
//
//  Created by duanchenvip on 15/10/27.
//  Copyright © 2015年 duanchenvip. All rights reserved.
//

#import "ViewController.h"
#import "DCStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)success {
    [DCStatusBarHUD showSuccess:@"成功"];
}
- (IBAction)file:(id)sender {
    [DCStatusBarHUD showError:@"失败"];
}
- (IBAction)loading:(id)sender {
    [DCStatusBarHUD showLoading:@"正在登陆"];
}
- (IBAction)hide:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
