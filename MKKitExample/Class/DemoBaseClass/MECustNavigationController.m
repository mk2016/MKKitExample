//
//  MECustNavigationController.m
//  MKKitExample
//
//  Created by xmk on 2017/2/10.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MECustNavigationController.h"

@interface MECustNavigationController ()

@end

@implementation MECustNavigationController

+ (void)initialize{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName : [UIColor blueColor]
                                     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBottomLineHidden:YES];
    
    [self setBackgroundOpacityColor:[UIColor greenColor]];
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
