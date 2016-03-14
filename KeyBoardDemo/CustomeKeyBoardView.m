//
//  CustomeKeyBoardView.m
//  KeyBoardDemo
//
//  Created by LSH on 16/1/5.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "CustomeKeyBoardView.h"


static NSInteger const kWMKeyboardNumberKeyCount = 12;
static NSInteger const KeyboardNumberDeleteIndex = 9;
static NSInteger const KeyboardNumberDoneIndex = 11;


@interface CustomeKeyBoardView()

@property (strong, nonatomic) NSArray *numberKeys;



@end
@implementation CustomeKeyBoardView

+ (CustomeKeyBoardView *)loadKeyBoardWithFrame:(CGRect)frame
{
    CustomeKeyBoardView *view = [[self alloc]initWithFrame:frame];
    [view setFrame:frame];
    return view;
}


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    int row = 4;
    int column = 3;
    
    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < kWMKeyboardNumberKeyCount; i++) {
        KeyBoardButton *button = [KeyBoardButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidth, keyHeight)];
        [self addSubview:button];
        WS(weakSelf);
        [button setButtonClickBlock:^(KeyBoardType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        [array addObject:button];
        if (i == KeyboardNumberDeleteIndex) {
            button.type = KeyBoardType_Delete;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button addDeleteBtnWay];
        } else if (i == KeyboardNumberDoneIndex) {
            button.type = KeyBoardType_Done;
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        } else {
            button.type = KeyBoardType_Other;
        }
        
        keyX += keyWidth;
        
        if ((i + 1) % column == 0) {
            keyX = 0;
            keyY += keyHeight;
        }
    }
    self.numberKeys = array;
    
    // 水平分隔线
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = frame.size.width;
    CGFloat viewH = 0.5;
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        
        viewY += keyHeight;
    }
    
    // 垂直分隔线
    viewX = keyWidth;
    viewY = 0;
    viewW = 0.5;
    viewH = frame.size.height;
    for (int i = 0; i < column - 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        
        viewX += keyWidth;
    }
}

- (void)exchangeNumber {
    NSMutableArray *numbers = [NSMutableArray array];
    
    int startNum = 0;
    int length = 10;
    
    for (int i = startNum; i < length; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    for (int i = 0; i < self.numberKeys.count; i++) {
        KeyBoardButton *button = self.numberKeys[i];
        
        if (i == KeyboardNumberDeleteIndex) {
            [button setTitle:@"删除" forState:UIControlStateNormal];
            continue;
        } else if (i == KeyboardNumberDoneIndex) {
            [button setTitle:@"完成" forState:UIControlStateNormal];
            continue;
        }
        int index = arc4random() % numbers.count;
        [button setTitle:numbers[index] forState:UIControlStateNormal];
        
        [numbers removeObjectAtIndex:index];
    }
}





@end
