//
//  XZDrawBoard.h
//  XZDoodleView
//
//  Created by MYKJ on 17/1/11.
//  Copyright © 2017年 zhaoyongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoodleConfig.h"

@interface XZDrawBoard : UIView

@property (nonatomic, strong) DoodleConfig *config;

- (void)revoke;

- (void)clearAll;

@end
