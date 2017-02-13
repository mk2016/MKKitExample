//
//  MKBase_VC.m
//  MKKit
//
//  Created by xmk on 2017/2/9.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBase_VC.h"

@interface MKBase_VC ()
@property (nonatomic, assign) BOOL rootVC;      /*!< 是否是首页，控制返回按钮 */
@end

@implementation MKBase_VC

- (void)setParams:(NSDictionary *)params{
    if (params) {
        DLog(@"params : %@", params);
        NSString *titleStr = params[@"title"];
        if (titleStr && titleStr.length > 0) {
            self.title = titleStr;
        }
        NSString *jsonParam = [params objectForKey:@"param"];
        NSDictionary *dic = [NSDictionary mk_dictionaryWithJson:jsonParam];
        self.routeParamDic = dic;
    }
}

- (void)dealloc{
    [MKNotification removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MKCOLOR_RGB(245, 245, 249);
    
    if (self.navigationController == nil || (self.navigationController && self.navigationController.childViewControllers.count <= 1)) {
        self.rootVC = YES;
    }
    
    
    if (!self.rootVC || self.needBackBtn) {
        UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBack.frame = CGRectMake(0, 0, 44, 44);
        [btnBack setImage:[UIImage imageNamed:self.backImageName] forState:UIControlStateNormal];
        btnBack.titleLabel.font = [UIFont systemFontOfSize:16];
        [btnBack addTarget:self action:@selector(backOnclick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *itemBack = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
        UIBarButtonItem *navgationSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        navgationSpaceLeft.width = -20;
        self.navigationItem.leftBarButtonItems = @[navgationSpaceLeft, itemBack];
    }
    
    // Do any additional setup after loading the view.
}

/** 返回按钮 */
- (void)backOnclick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)backImageName{
    if (!_backImageName) {
        _backImageName = @"public_img_back";
    }
    return _backImageName;
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
