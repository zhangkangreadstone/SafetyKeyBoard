//
//  SafeKeyBoardTool.m
//  KeyBoardDemo
//
//  Created by LSH on 16/1/11.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "SafeKeyBoardTool.h"
#import "CustomeKeyBoardView.h"
#import "AppDelegate.h"
@interface SafeKeyBoardTool()

@property (nonatomic, strong)CustomeKeyBoardView *keyBoardView;

@property (nonatomic, strong)UITextField *textfield;

@property (nonatomic, assign)NSInteger length;/////限制的字符长度

@property (nonatomic, strong)NSMutableArray *allTextFieldArray;

@end
@implementation SafeKeyBoardTool

+ (SafeKeyBoardTool *)shareKeyBoardTool
{
    static SafeKeyBoardTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[[self class] alloc]init];
    });
    return tool;
}

- (void)setSafeKeyBoard:(UITextField *)textField withTextLength:(NSInteger)len
{
    self.textfield = textField;
    self.textfield.tag = len;
    self.textfield.inputView = self.keyBoardView;
    [textField addTarget:self action:@selector(changeTextField:) forControlEvents:UIControlEventEditingDidBegin];
}

- (void)changeTextField:(UITextField *)textField
{
    [self.keyBoardView exchangeNumber];
    self.textfield = textField;
    self.length = self.textfield.tag;
}

- (void)setSafeKeyBoard:(UITextField *)textField
{
    [self setSafeKeyBoard:textField withTextLength:1000];
}

-(CustomeKeyBoardView *)keyBoardView
{
    if (!_keyBoardView) {
        _keyBoardView = [CustomeKeyBoardView loadKeyBoardWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 250)];
        __block SafeKeyBoardTool *weakSelf = self;
        _keyBoardView.block = ^(KeyBoardType type ,NSString *text){
            if (weakSelf.textfield.text.length < self.length) {
                [weakSelf changeTextField:type Text:text];
            }else{
                if (type == KeyBoardType_Delete||type == KeyBoardType_Done) {
                    [weakSelf changeTextField:type Text:text];
                }
            }
        };
    }
    return _keyBoardView;
}


- (void)changeTextField:(KeyBoardType)type Text:(NSString *)text
{
    switch (type) {
        case KeyBoardType_Delete: {
            [self.textfield changeTextFieldText:text];
        }
            break;
        case KeyBoardType_Done: {
            AppDelegate*appDelegate = [UIApplication sharedApplication].delegate;
            [appDelegate.window endEditing:YES];
        }
            break;
        case KeyBoardType_Other: {
            [self.textfield changeTextFieldText:text];
        }
            break;
    }
}

@end
