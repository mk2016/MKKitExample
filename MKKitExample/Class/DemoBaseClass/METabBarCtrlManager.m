//
//  METabBarCtrlManager.m
//  MKKitExample
//
//  Created by xmk on 2017/2/13.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "METabBarCtrlManager.h"

@implementation METabBarCtrlManager

MKImpl_sharedInstance(METabBarCtrlManager)

- (void)setSelectWithIndex:(NSInteger)index{
    if (self.rootTabbarController.viewControllers.count > index) {
        [self.rootTabbarController setSelectedIndex:index];
    }
}

- (id)getCurrentNavCtrl{
    NSInteger index = [self.rootTabbarController selectedIndex];
    return self.rootTabbarController.viewControllers[index];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

#pragma mark - ***** lazy *****
- (MKBaseTabBarController *)rootTabbarController{
    if (!_rootTabbarController) {
        _rootTabbarController = [[MKBaseTabBarController alloc] init];
    }
    return _rootTabbarController;
}

@end
