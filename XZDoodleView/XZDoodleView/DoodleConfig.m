//
//  DoodleConfig.m
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import "DoodleConfig.h"

@implementation DoodleConfig

+ (instancetype)config {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.drewColor = [UIColor redColor];
        self.lineWidth = 5;
        self.lineCap = kCGLineCapRound;
        self.lineJoin = kCGLineJoinRound;
    }
    return self;
}


@end
