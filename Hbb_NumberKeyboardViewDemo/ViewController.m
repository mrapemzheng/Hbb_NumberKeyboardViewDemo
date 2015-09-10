//
//  ViewController.m
//  Hbb_NumberKeyboardViewDemo
//
//  Created by CHENG DE LUO on 15/9/10.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import "ViewController.h"
#import "Hbb_NumberKeyboardView.h"

@interface ViewController ()<Hbb_NumberKeyboardViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UITextField *tf2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tf.tag = 1;
    self.tf2.tag = 2;
    [Hbb_NumberKeyboardView registerTextField:self.tf withDelegate:self];
    
    [Hbb_NumberKeyboardView registerTextField:self.tf2 withDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Hbb_NumberKeyboardViewDelegate

/**
 *  上一项
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)lastOptionDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView
{
    NSLog(@"上一项");
    if (hbb_NumberKeyboardView.serviceTextField.tag > 1) {
        NSInteger tag = hbb_NumberKeyboardView.serviceTextField.tag - 1;
        UITextField *tf = (UITextField *)[self.view viewWithTag:tag];
        [tf becomeFirstResponder];
    }
}

/**
 *  下一项
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)nextOptionDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView
{
    NSLog(@"下一项");
    
    if (hbb_NumberKeyboardView.serviceTextField.tag < 2) {
        NSInteger tag = hbb_NumberKeyboardView.serviceTextField.tag + 1;
        UITextField *tf = (UITextField *)[self.view viewWithTag:tag];
        [tf becomeFirstResponder];
    }
}

/**
 *  回退一个
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)deleteDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView
{
    NSLog(@"回退一个");
}

/**
 *  保存
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)saveDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView
{
    NSLog(@"保存");
    [hbb_NumberKeyboardView hideKeyboard];
}

/**
 *  隐藏被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)hideDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView
{
    NSLog(@"隐藏被点击");
    
}

/**
 *  数字被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 *  @param numStr                 数字字符串
 */
- (void)hbb_NumberKeyboardView:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView numberDidClick:(NSString *)numStr
{
    NSLog(@"数字被点击:%@", numStr);
}

/**
 
 *  正负数按钮被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 *  @param positiveOrNegative     0:正 1:负
 */
- (void)hbb_NumberKeyboardView:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView plusOrMinusDidClick:(NSInteger)positiveOrNegative
{
    NSLog(@"正负数按钮被点击:%@", positiveOrNegative == 0 ? @"正" : @"负");
}


@end
