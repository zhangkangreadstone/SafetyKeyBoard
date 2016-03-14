//
//  KeyBoardButton.h
//  KeyBoardDemo
//
//  Created by LSH on 16/1/5.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

typedef enum : NSUInteger {
    KeyBoardType_Delete,   // 按键类型：删除
    KeyBoardType_Done,  // 按键类型：完成
    KeyBoardType_Other  // 按键类型：其他
} KeyBoardType;

typedef void(^ButtonClickBlock)(KeyBoardType buttonType, NSString *text);

@interface KeyBoardButton : UIButton

@property (nonatomic,assign)KeyBoardType type;////按钮类型

@property (nonatomic, strong)NSString *title;////按钮上面的文字

@property (nonatomic, assign)NSInteger index;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)addDeleteBtnWay;

- (void)setButtonClickBlock:(ButtonClickBlock)block;


@end
