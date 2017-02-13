//
//  METabBarCtrlManager.h
//  MKKitExample
//
//  Created by xmk on 2017/2/13.
//  Copyright © 2017年 mk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKBaseTabBarController.h"

@interface METabBarCtrlManager : NSObject

@property (nonatomic, strong) MKBaseTabBarController *rootTabbarController;
@property (nonatomic, copy) MKBaseTabBarController *mainTabBarCtrl;

+ (instancetype)sharedInstance;

@end
