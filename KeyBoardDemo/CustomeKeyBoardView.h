//
//  CustomeKeyBoardView.h
//  KeyBoardDemo
//
//  Created by LSH on 16/1/5.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardButton.h"

@interface CustomeKeyBoardView : UIView
typedef void(^KeyboardBlock)(KeyBoardType type, NSString *text);

///放置键盘
@property (copy, nonatomic) KeyboardBlock block;

+ (CustomeKeyBoardView *)loadKeyBoardWithFrame:(CGRect)frame;

- (void)exchangeNumber;

@end
