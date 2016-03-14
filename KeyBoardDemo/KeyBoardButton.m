//
//  KeyBoardButton.m
//  KeyBoardDemo
//
//  Created by LSH on 16/1/5.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "KeyBoardButton.h"


@interface KeyBoardButton()

@property (copy, nonatomic) ButtonClickBlock block;

@property (nonatomic, strong)UILongPressGestureRecognizer *longPress;

@property (nonatomic, strong)NSTimer *timer;

@end
@implementation KeyBoardButton

+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initKeyButtonWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)addDeleteBtnWay
{
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self addGestureRecognizer:_longPress];
}

- (void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
        if (longPress.state == UIGestureRecognizerStateBegan) {
            if (!_timer) {
                _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(keyClicked:) userInfo:nil repeats:YES];
            }
        }else if (longPress.state == UIGestureRecognizerStateEnded){
            
            if (_timer) {
                [_timer setFireDate:[NSDate distantFuture]];
                [_timer isValid];
            }
            if (_timer.isValid) {
                [_timer invalidate];
            }
            _timer=nil;
        }else if(longPress.state == UIGestureRecognizerStateCancelled){
            
        }
}


-(UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)setButtonClickBlock:(ButtonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(KeyBoardButton *)button {
    NSString *text = @"";
    if (self.type == KeyBoardType_Other) {
        text = button.titleLabel.text;
    }
    self.block(self.type, text);
}


@end
