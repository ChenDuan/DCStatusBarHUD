//
//  DCStatusBarHUD.h
//  DCStatusBarHUDDemo
//
//  Created by duanchenvip on 15/10/27.
//  Copyright © 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCStatusBarHUD : NSObject

//文字信息
+ (void)showText:(NSString *)text;

//显示文字信息图片
+ (void)showText:(NSString *)text image:(UIImage *)image;

+ (void)showText:(NSString *)text imageName:(NSString *)imageName;

//成功信息
+ (void)showSuccess:(NSString *)text;

//失败信息
+ (void)showError:(NSString *)text;

//加载信息

+ (void)showLoading:(NSString *)text;

+ (void)hide;




@end
