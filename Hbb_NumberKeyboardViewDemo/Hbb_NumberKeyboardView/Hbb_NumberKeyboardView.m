//
//  Hbb_NumberKeyboardView.m
//  Hbb_NumberKeyboardViewDemo
//
//  Created by CHENG DE LUO on 15/9/10.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import "Hbb_NumberKeyboardView.h"
#import "UIView+Utils.h"

@interface Hbb_NumberKeyboardView ()

@property (weak, nonatomic) IBOutlet UIButton *lastOptionBtn;
@property (weak, nonatomic) IBOutlet UIButton *add;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UIButton *nextOption;
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;
@property (weak, nonatomic) IBOutlet UIButton *nine;
@property (weak, nonatomic) IBOutlet UIButton *dot;
@property (weak, nonatomic) IBOutlet UIButton *zero;
@property (weak, nonatomic) IBOutlet UIButton *hide;
@property (weak, nonatomic) IBOutlet UIButton *deleteOne;
@property (weak, nonatomic) IBOutlet UIButton *plusOrMinus;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UIView *horizontalLine1;
@property (weak, nonatomic) IBOutlet UIView *horizontalLine2;
@property (weak, nonatomic) IBOutlet UIView *horizontalLine3;
@property (weak, nonatomic) IBOutlet UIView *horizontalLine4;
@property (weak, nonatomic) IBOutlet UIView *verticalLine3;
@property (weak, nonatomic) IBOutlet UIView *verticalLine2;
@property (weak, nonatomic) IBOutlet UIView *verticalLine1;

//@property (nonatomic, assign) BOOL longPressHasbegan;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation Hbb_NumberKeyboardView

+ (instancetype)registerTextField:(UITextField *)textField withDelegate:(id<Hbb_NumberKeyboardViewDelegate>)delegate
{
    
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"Hbb_NumberKeyboardView" owner:self options:nil];
    Hbb_NumberKeyboardView *hbb_NumberKeyboardView = [arr firstObject];
    hbb_NumberKeyboardView.serviceTextField = textField;
    hbb_NumberKeyboardView.delegate = delegate;
    textField.inputView = hbb_NumberKeyboardView;
    
    return hbb_NumberKeyboardView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width / 4;
    CGFloat height = self.height / 5;
    self.lastOptionBtn.frame = CGRectMake(width * 0, height * 0, width, height);
    self.add.frame = CGRectMake(width * 1, height * 0, width, height);
    self.minus.frame = CGRectMake(width * 2, height * 0, width, height);
    self.nextOption.frame = CGRectMake(width * 3, height * 0, width, height);
    self.one.frame = CGRectMake(width * 0, height * 1, width, height);
    self.two.frame = CGRectMake(width * 1, height * 1, width, height);
    self.three.frame = CGRectMake(width * 2, height * 1, width, height);
    self.four.frame = CGRectMake(width * 0, height * 2, width, height);
    self.five.frame = CGRectMake(width * 1, height * 2, width, height);
    self.six.frame = CGRectMake(width * 2, height * 2, width, height);
    self.seven.frame = CGRectMake(width * 0, height * 3, width, height);
    self.eight.frame = CGRectMake(width * 1, height * 3, width, height);
    self.nine.frame = CGRectMake(width * 2, height * 3, width, height);
    self.zero.frame = CGRectMake(width * 1, height * 4, width, height);
    self.dot.frame = CGRectMake(width * 2, height * 4, width, height);
    
    self.hide.frame = CGRectMake(width * 0, height * 4, width, height);
    self.deleteOne.frame = CGRectMake(width * 3, height * 1, width, height);
    self.plusOrMinus.frame = CGRectMake(width * 3, height * 2, width, height);
    self.save.frame = CGRectMake(width * 3, height * 3, width, height * 2);
    
    self.horizontalLine1.frame = CGRectMake(0, height * 1, self.width, 1);
    self.horizontalLine2.frame = CGRectMake(0, height * 2, self.width, 1);
    self.horizontalLine3.frame = CGRectMake(0, height * 3, self.width, 1);
    self.horizontalLine4.frame = CGRectMake(0, height * 4, self.width - width, 1);
    
    self.verticalLine1.frame = CGRectMake(width * 1, 0, 1, self.height);
    self.verticalLine2.frame = CGRectMake(width * 2, 0, 1, self.height);
    self.verticalLine3.frame = CGRectMake(width * 3, 0, 1, self.height);
    
}

- (void)showKeyboard
{
    [self.serviceTextField becomeFirstResponder];
}

- (void)hideKeyboard
{
    [self.serviceTextField resignFirstResponder];
}

- (NSString *)text
{
    _text = self.serviceTextField.text;
    return _text;
}

#pragma mark - IBAction

/**
 *  上一项
 *
 */
- (IBAction)lastOptionDidClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(lastOptionDidClick:)]) {
        [self.delegate lastOptionDidClick:self];
    }
}

/**
 *  下一项
 *
 */
- (IBAction)nextOptionDidClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(nextOptionDidClick:)]) {
        [self.delegate nextOptionDidClick:self];
    }
}


/**
 *  删除
 *
 */
- (IBAction)deleteDidClick:(id)sender {
    NSInteger length = self.serviceTextField.text.length;
    if (length != 0) {
        NSString *substring = [self.serviceTextField.text substringWithRange:NSMakeRange(0, length - 1)];
        self.serviceTextField.text = substring;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteDidClick:)]) {
        [self.delegate deleteDidClick:self];
    }
}

/**
 *  保存
 *
 */
- (IBAction)saveDidClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(saveDidClick:)]) {
        [self.delegate saveDidClick:self];
    }
}

/**
 *  隐藏被点击
 *
 */
- (IBAction)hideDidClick:(id)sender {
    [self.serviceTextField resignFirstResponder];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hideDidClick:)]) {
        [self.delegate hideDidClick:self];
    }
}

/**
 *  数字被点击
 *
 */
- (IBAction)numberDidClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.titleLabel.text;
    
    //如果输入"."
    if ([title isEqualToString:@"."]) {
        //如果当前输入框文本为""
        if ([self.serviceTextField.text isEqualToString:@""]) {
            self.serviceTextField.text = @"0.";
        //如果输入框文本不为"",并且不包含"."
        } else if(self.serviceTextField.text.length != 0 && ![self.serviceTextField.text containsString:@"."]) {
            self.serviceTextField.text = [NSString stringWithFormat:@"%@%@", self.serviceTextField.text, @"."];
        }
    //输入其他数字
    } else {
        self.serviceTextField.text = [NSString stringWithFormat:@"%@%@", self.serviceTextField.text, title];
    }
    
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hbb_NumberKeyboardView:numberDidClick:)]) {
        [self.delegate hbb_NumberKeyboardView:self numberDidClick:title];
    }
}

/**
 *  正负被点击
 *
 */
- (IBAction)plusOrMinusDidClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    //颠倒0:正  1:负
    if (btn.tag > 0) {
        btn.tag = 0;
    } else if(btn.tag <= 0) {
        btn.tag = 1;
    }
    
    NSString *previousText = self.serviceTextField.text;
    //正
    if(btn.tag == 0) {
        //第一个字符如果为"-"
        if (previousText.length != 0 && [[previousText substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"-"]) {
            self.serviceTextField.text = [previousText substringWithRange:NSMakeRange(1, previousText.length -1)];
        }
    
    //负
    } else {
        //第一个字符如果不为"-"
        if (previousText.length != 0 && ![[previousText substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"-"]) {
            self.serviceTextField.text = [NSString stringWithFormat:@"%@%@", @"-", previousText];
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hbb_NumberKeyboardView:plusOrMinusDidClick:)]) {
        [self.delegate hbb_NumberKeyboardView:self plusOrMinusDidClick:btn.tag];
    }
}

/**
 *  增 被点击
 *
 */
- (IBAction)plusingDidClick:(id)sender {
    
}

/**
 *  减 被点击
 *
 */
- (IBAction)minusingDidClick:(id)sender {
    
}

- (IBAction)longPressGesture:(UIGestureRecognizer *)sender {
        UIButton *b = (UIButton *)sender.view;
        if (sender.state == UIGestureRecognizerStateBegan) {
            [b setBackgroundImage:[UIImage imageNamed:@"Hbb_NumberKeyboardView.bundle/keyboardNum_g.png"] forState:UIControlStateNormal];
            
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(deleteANumber) userInfo:nil repeats:YES];
    
        } else if(sender.state == UIGestureRecognizerStateEnded
                  || sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateFailed) {
            [b setBackgroundImage:nil forState:UIControlStateNormal];
            
            if (self.timer) {
                [self.timer invalidate];
                self.timer = nil;
            }
        }
}


- (void)deleteANumber
{
//    NSLog(@"删除");
    NSInteger length = self.serviceTextField.text.length;
    if (length != 0) {
        NSString *substring = [self.serviceTextField.text substringWithRange:NSMakeRange(0, length - 1)];
        self.serviceTextField.text = substring;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteDidClick:)]) {
        [self.delegate deleteDidClick:self];
    }
    
}

@end
