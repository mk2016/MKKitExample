//
//  MEMain_VC.m
//  MKKitExample
//
//  Created by xmk on 2017/2/9.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MEMain_VC.h"
#import <MKKit/MKKit.h>
#import "UIViewController+MKAdd.h"
#import "MKBaseTableViewCell.h"
#import "TestModel.h"

#import "MKKitConst.h"

@interface MEMain_VC ()

@end

@implementation MEMain_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MKDome";
    
    NSArray *array = @[kRoute_test1 , kRoute_test2];
    [[MKRouterHelper sharedInstance] initRouterWithAllowExternalRouteArray:array registerBlock:^{
        [[MKRouter sharedInstance] map:kRoute_test1 toControllerClass:[MEMain_VC class]];
        [[MKRouter sharedInstance] map:kRoute_test2 toBlock:^id(id params) {
            ELog(@"params : %@", [params mk_jsonString]);
            return params;
        }];
    }];
  
    [self setupUISingleTableView];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"public_bg_Balloon"]];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (void)deepCopySelf{
    TestModel * model = [[TestModel alloc] init];
    model.name = @"MK";
    model.phone = @(13600000000);
    model.age = 30;
    model.gender = YES;
    model.array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    TestModel *modelCopy = [model copySelfPerfect];
    ELog(@"%p, %p", &model, &modelCopy);
    NSDictionary *dic = [model mj_keyValues];
    ELog(@"%@", [dic mk_jsonString]);
}

#pragma mark - ***** UITableView delegate *****
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    MKBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MKBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self deepCopySelf];
    }else if (indexPath.row == 1){
        ELog(@"mk_description : %@", [self.view mk_description]);
    }else if (indexPath.row == 2){
        NSUInteger i = hexStringToInt(@"0x666666");
        ELog(@"i : %lu", (unsigned long)i);
    }else if (indexPath.row == 3){
        UIViewController *vc = [[MKRouterHelper sharedInstance] matchVCWithRoute:kRoute_test1];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        [[MKRouterHelper sharedInstance] matchVCWithRoute:kRoute_test2];
    }
    else{
        MEMain_VC *vc = [[MEMain_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
