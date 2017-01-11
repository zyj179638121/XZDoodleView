//
//  XZDrawBoard.m
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import "XZDrawBoard.h"

@interface XZDrawBoard ()

@property (nonatomic, strong) NSMutableArray<UIBezierPath *> *lineArr;

@end

@implementation XZDrawBoard

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 添加手势
        self.backgroundColor = [UIColor clearColor];
        [self addGestureRecognizer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self.config.drewColor set];
    for (UIBezierPath *path in self.lineArr) {
        [path stroke];
    }
}

- (void)addGestureRecognizer {
    // panGestureRecognizer
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)]];
}

#pragma mark - GestureRecognizerAction

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)PanGR {
    UIGestureRecognizerState state = PanGR.state;
    if (state == UIGestureRecognizerStateBegan) {
    
        CGPoint startPoint = [PanGR locationInView:PanGR.view];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path setLineWidth:self.config.lineWidth];
        [path setLineCapStyle:self.config.lineCap];
        [path setLineJoinStyle:self.config.lineJoin];
        [path moveToPoint:startPoint];
        [self.lineArr addObject:path];
        [self setNeedsDisplay];
        
    }else if (state == UIGestureRecognizerStateChanged) {
        
        CGPoint currentPoint = [PanGR locationInView:PanGR.view];
        UIBezierPath *path = [self.lineArr lastObject];
        [path addLineToPoint:currentPoint];
        [self setNeedsDisplay];
        
    }else if (state == UIGestureRecognizerStateEnded) {

    }
    
}

#pragma mark - public methods

- (void)revoke {
    [self.lineArr removeLastObject];
    [self setNeedsDisplay];
}

- (void)clearAll {
    [self.lineArr removeAllObjects];
    [self setNeedsDisplay];
}


#pragma mark - getter methods

- (NSMutableArray<UIBezierPath *> *)lineArr {
    if (!_lineArr) {
        _lineArr = [NSMutableArray array];
    }
    return _lineArr;
}


@end
