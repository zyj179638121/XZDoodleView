//
//  XZDoodleView.m
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import "XZDoodleView.h"
#import "XZDrawBoard.h"
#import <Masonry/Masonry.h>

@interface XZDoodleView ()

@property (nonatomic, strong) UIImageView *drewImageView;
@property (nonatomic, strong) DoodleConfig *config;
@property (nonatomic, strong) XZDrawBoard *drawBoard;

@end

@implementation XZDoodleView

- (instancetype)initWithFrame:(CGRect)frame config:(DoodleConfig *)config {
    self = [super initWithFrame:frame];
    if (self) {
        // 添加imageView
        [self createSubviews];
        // 设置config
        self.config = config ? config : [DoodleConfig config];
    }
    return self;
}

#pragma mark - private methods

- (void)createSubviews {
    self.drewImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.drewImageView];
    [self addSubview:self.drawBoard];
}


- (void)updateConstraints {
    [super updateConstraints];
    
    [self.drewImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.drawBoard mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UIImage *)getImageFromView {
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    // 将view的layer渲染到上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 获取上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - public methods

- (void)changeImage:(UIImage *)image {
    self.drewImageView.image = image;
}

- (void)revoke {
    [self.drawBoard revoke];
}

- (void)clearAll {
    [self.drawBoard clearAll];
}

- (void)save {
    UIImage *currentImage = [self getImageFromView];
    UIImageWriteToSavedPhotosAlbum(currentImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"图片保存失败");
    }else{
        NSLog(@"图片保存成功");
    }
}

#pragma mark - setter methods

- (void)setConfig:(DoodleConfig *)config {
    _config = config;
    if (config.image) {
        self.drewImageView.image = config.image;
    }
    self.drawBoard.config = config;
}

#pragma mark - getter methods

- (UIImageView *)drewImageView {
    if (!_drewImageView) {
        _drewImageView = [[UIImageView alloc] init];
        _drewImageView.backgroundColor = [UIColor whiteColor];
    }
    return _drewImageView;
}

- (XZDrawBoard *)drawBoard {
    if (!_drawBoard) {
        _drawBoard = [[XZDrawBoard alloc] init];
    }
    return _drawBoard;
}



@end
