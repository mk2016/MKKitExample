//
//  MKELogin_VC.m
//  MKKitExample
//
//  Created by xmk on 2017/3/15.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKELogin_VC.h"
#import "ReactiveObjC.h"


@interface MKELogin_VC ()

@property (weak, nonatomic) IBOutlet UITextField *tfAccount;
@property (weak, nonatomic) IBOutlet UITextField *tfPwd;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@end

@implementation MKELogin_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    RACSubject *subject = [RACSubject subject];
//    [subject subscribeNext:^(id  _Nullable x) {
//        ELog(@"%@", x);
//    }];
    
//    self.tfAccount.rac_textSignal subscri
    
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
