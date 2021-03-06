//
//  SafeKeyBoardTool.h
//  KeyBoardDemo
//
//  Created by LSH on 16/1/11.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextField+Editing.h"

/*
 * qq:1311054081@qq.com
 * 邮箱:zhangkangreadstone.com
 */
@interface SafeKeyBoardTool : NSObject

+ (SafeKeyBoardTool *)shareKeyBoardTool;

- (void)setSafeKeyBoard:(UITextField *)textField;
- (void)setSafeKeyBoard:(UITextField *)textField withTextLength:(NSInteger)len;

@end
