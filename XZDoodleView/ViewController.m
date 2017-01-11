//
//  ViewController.m
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import "ViewController.h"
#import "XZDoodleView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) XZDoodleView *doodleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self setupChildViews];
    
    [self testNavi];

}

- (void)setupChildViews {
    [self.view addSubview:self.doodleView];
}

- (void)testNavi {
    // 保存
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"save"] style:UIBarButtonItemStyleDone target:self action:@selector(saveToMyPhotos)];
    // 撤销
    UIBarButtonItem *revoke = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"revoke"] style:UIBarButtonItemStyleDone target:self action:@selector(revokeAction)];
    // 清空
    UIBarButtonItem *clearAll = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"clearAll"] style:UIBarButtonItemStyleDone target:self action:@selector(clearAllAction)];
    self.navigationItem.rightBarButtonItems = @[clearAll,revoke,save];
}

- (void)saveToMyPhotos {
    [self.doodleView save];
}

- (void)revokeAction {
    [self.doodleView revoke];
}

- (void)clearAllAction {
    [self.doodleView clearAll];
}


- (void)updateViewConstraints {
    [super updateViewConstraints];
    [self.doodleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - getter methods

- (XZDoodleView *)doodleView {
    if (!_doodleView) {
        DoodleConfig *config = [DoodleConfig config];
        config.image = [UIImage imageNamed:@"ocean"];
        config.drewColor = [UIColor yellowColor];
        _doodleView = [[XZDoodleView alloc] initWithFrame:CGRectZero config:config];
    }
    return _doodleView;
}

@end
