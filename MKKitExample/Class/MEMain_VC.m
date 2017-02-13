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

@interface MEMain_VC ()
@end

@implementation MEMain_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MKDome";
  
    [self setupUISingleTableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    MKBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MKBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MEMain_VC *vc = [[MEMain_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
