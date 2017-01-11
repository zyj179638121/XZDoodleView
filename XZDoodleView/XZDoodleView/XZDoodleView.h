//
//  XZDoodleView.h
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoodleConfig.h"

@interface XZDoodleView : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(DoodleConfig *)config;

/**
 换图
 
 @param image 传入的图片
 */
- (void)changeImage:(UIImage *)image;

/**
 撤销
 */
- (void)revoke;

/**
 清除
 */
- (void)clearAll;

/**
 保存
 */
- (void)save;

@end
