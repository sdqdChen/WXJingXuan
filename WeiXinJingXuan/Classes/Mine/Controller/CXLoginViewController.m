//
//  CXLoginViewController.m
//  WeiXinJingXuan
//
//  Created by 陈晓 on 2016/12/12.
//  Copyright © 2016年 陈晓. All rights reserved.
//

#import "CXLoginViewController.h"
#import "CXNumberTextField.h"

@interface CXLoginViewController ()
@property (weak, nonatomic) IBOutlet CXNumberTextField *phoneTextField;
//获取验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@end

@implementation CXLoginViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearButton.hidden = YES;
    [self.clearButton addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    [self.phoneTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.verificationCodeButton addTarget:self action:@selector(getVerificationCode:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 监听事件
/*
 * 文本框的值发生变化
 */
- (void)textFieldDidChange:(UITextField *)textField
{
    self.clearButton.hidden = NO;
    if (textField.text.length >= 11) {
        textField.text = [textField.text substringToIndex:11];
        self.verificationCodeButton.enabled = YES;
        [self.verificationCodeButton setTitleColor:CXBlueColor forState:UIControlStateNormal];
    } else {
        self.verificationCodeButton.enabled = NO;
    }
}
/*
 * 获取验证码
 */
- (void)getVerificationCode:(UIButton *)button
{
    CXLog(@"获取验证码");
}
/*
 * 清除文本
 */
- (void)clearText
{
    self.phoneTextField.text = @"";
    self.verificationCodeButton.enabled = NO;
}

- (IBAction)close:(id)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
