//
//  Hbb_NumberKeyboardView.h
//  Hbb_NumberKeyboardViewDemo
//
//  Created by CHENG DE LUO on 15/9/10.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class Hbb_NumberKeyboardView;
@protocol Hbb_NumberKeyboardViewDelegate <NSObject>

@optional
/**
 *  上一项
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)lastOptionDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView;

/**
 *  下一项
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)nextOptionDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView;

/**
 *  回退一个
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)deleteDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView;

/**
 *  保存
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)saveDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView;

/**
 *  隐藏被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 */
- (void)hideDidClick:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView;

/**
 *  数字被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 *  @param numStr                 数字字符串
 */
- (void)hbb_NumberKeyboardView:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView numberDidClick:(NSString *)numStr;

/**
 *  正负数按钮被点击
 *
 *  @param hbb_NumberKeyboardView 数字键盘视图
 *  @param positiveOrNegative     0:正 1:负
 */
- (void)hbb_NumberKeyboardView:(Hbb_NumberKeyboardView *)hbb_NumberKeyboardView plusOrMinusDidClick:(NSInteger)positiveOrNegative;

@end

/**
 *  数字键盘视图
 */

@interface Hbb_NumberKeyboardView : UIView

@property (nonatomic, assign) UITextField *serviceTextField;
@property (nonatomic, assign) id<Hbb_NumberKeyboardViewDelegate> delegate;
@property (nonatomic, strong) NSString *text;
/**
 *  初始化并注册输入框
 *
 *  @param textField 输入框
 *  @param delegate  委托
 *
 *  @return 数字键盘视图对象
 */
+ (instancetype)registerTextField:(UITextField *)textField withDelegate:(id<Hbb_NumberKeyboardViewDelegate>)delegate;

- (void)showKeyboard;
- (void)hideKeyboard;

@end
