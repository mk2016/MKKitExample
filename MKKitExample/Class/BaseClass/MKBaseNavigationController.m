//
//  MKBaseNavigationController.m
//  MKKitExample
//
//  Created by xmk on 2017/2/10.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBaseNavigationController.h"

@interface MKBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MKBaseNavigationController

+ (void)initialize{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName : [UIColor redColor]
                                     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 自定义 navigation 添加右滑返回手势 */
    self.interactivePopGestureRecognizer.delegate = self;
}

/** push */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [super pushViewController:viewController animated:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
