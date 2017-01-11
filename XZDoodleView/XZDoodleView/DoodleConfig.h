//
//  DoodleConfig.h
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoodleConfig : NSObject

/**
 颜色
 */
@property (nonatomic, strong) UIColor *drewColor;

/**
 画线的宽度
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 线的两端的样式
 */
@property (nonatomic, assign) CGLineCap lineCap;

/**
 线转弯的时候的样式
 */
@property (nonatomic, assign) CGLineJoin lineJoin;

/**
 传入的图片
 */
@property (nonatomic, strong) UIImage *image;

+ (instancetype)config;

@end
