//
//  SafeKeyBoardTool.h
//  KeyBoardDemo
//
//  Created by LSH on 16/1/11.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextField+Editing.h"

@interface SafeKeyBoardTool : NSObject

+ (SafeKeyBoardTool *)shareKeyBoardTool;

- (void)setSafeKeyBoard:(UITextField *)textField;
- (void)setSafeKeyBoard:(UITextField *)textField withTextLength:(NSInteger)len;

@end
