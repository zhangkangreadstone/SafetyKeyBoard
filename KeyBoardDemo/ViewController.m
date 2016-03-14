//
//  ViewController.m
//  KeyBoardDemo
//
//  Created by LSH on 16/1/5.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "ViewController.h"
#import "SafeKeyBoardTool.h"

@interface ViewController ()<UITextFieldDelegate>


@property (nonatomic, strong)UITextField *textField;


@property (nonatomic, strong)UITextField *texteField0;

@end

@implementation ViewController


-(UITextField *)texteField0
{
    if (!_texteField0) {
        _texteField0 = [[UITextField alloc]initWithFrame:CGRectMake(50, 180, 275, 35)];
        _texteField0.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:_texteField0];
    }
    return _texteField0;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   _textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 120, 275, 35)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.secureTextEntry = NO;
    [[SafeKeyBoardTool shareKeyBoardTool]setSafeKeyBoard:_textField withTextLength:6];
    
    [self.view addSubview:_textField];
    
    [self texteField0];
    [[SafeKeyBoardTool shareKeyBoardTool]setSafeKeyBoard:_texteField0 withTextLength:8];
//    [self.texteField0 addTarget:self action:@selector(changeTextField:) forControlEvents:UIControlEventEditingDidBegin];
//    [self.textField addTarget:self action:@selector(changeTextField:) forControlEvents:UIControlEventEditingDidBegin];
   
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEditingTe)];
    [self.view addGestureRecognizer:tap];
    
    
    UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(50, 240, 275, 35)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.secureTextEntry = NO;
    [textField1 addTarget:self action:@selector(changeTextFieldContentText:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textField1];
}


- (void)changeTextFieldContentText:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
}




- (void)endEditingTe
{
    [self.view endEditing:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.texteField0 becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
