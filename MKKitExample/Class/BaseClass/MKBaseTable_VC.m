//
//  MKBaseTable_VC.m
//  MKKit
//
//  Created by xmk on 2017/2/9.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBaseTable_VC.h"

@interface MKBaseTable_VC ()

@end

@implementation MKBaseTable_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/** 设置 tableView */
- (void)setupUISingleTableView{
    [self setupUISingleTableViewWithStyle:UITableViewStyleGrouped];
}

- (void)setupUISingleTableViewWithStyle:(UITableViewStyle)style{
    _tableViewStyle = style;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

/** 加载源数据 */
- (void)loadDataSource {
    [self.datasArray removeAllObjects];
    // subClasse
}

/** 下拉刷新触发的方法 */
- (void)loadLastData{
    [self.datasArray removeAllObjects];
//    self.pageSizeInfo = nil;
    [self loadDataSource];
}

/** 上拉加载触发的方法 */
- (void)loadMoreData{
//    if (self.pageSizeInfo) {
//        self.pageSizeInfo.currentNum = @(self.pageSizeInfo.currentNum.integerValue+1);
//    }
    [self loadDataSource];
}

#pragma mark - ***** UITableView delegate *****
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

#pragma mark - ***** other method ******
- (void)configuraTableViewSeparatorInsetZero{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)configuraTableViewSeparatorInset:(UIEdgeInsets)inset{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:inset];
    }
}

- (void)configuraSectionIndexBackgroundClearColor{
    if ([self.tableView respondsToSelector:@selector(setSectionIndexBackgroundColor:)]) {
        self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
}

#pragma mark - ***** lazy ******
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor =  MKCOLOR_RGB(245, 245, 249);
        tableView.separatorColor = MKCOLOR_HEX(0xE5E5E5);
        tableView.tableFooterView = [UIView new];
        tableView.rowHeight = 44;
        _tableView = tableView;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UITableViewStyle)tableViewStyle{
    if (!_tableViewStyle) {
        _tableViewStyle = UITableViewStylePlain;
    }
    return _tableViewStyle;
}

- (NSMutableArray *)datasArray {
    if (!_datasArray) {
        _datasArray = [[NSMutableArray alloc] init];
    }
    return _datasArray;
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
