//
//  DoodleConfig.h
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoodleConfig : NSObject

@property (nonatomic, strong) UIColor *drewColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGLineCap lineCap;
@property (nonatomic, assign) CGLineJoin lineJoin;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)config;

@end
