//
//  MKBaseTable_VC.h
//  MKKit
//
//  Created by xmk on 2017/2/9.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBase_VC.h"

@interface MKBaseTable_VC : MKBase_VC<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;     /*!< main tableView */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;     /*!< 床架tableView 前设置 */
@property (nonatomic, strong) NSMutableArray *datasArray;       /*!< 数据源 */


/** 设置 tableView */
- (void)setupUISingleTableView;
- (void)setupUISingleTableViewWithStyle:(UITableViewStyle)style;

/**
 *  加载本地或者网络数据源 下拉刷新调用 此方法， 记得重置  datasArray
 */
- (void)loadDataSource;

/**
 *  下拉刷新触发的方法
 */
- (void)loadLastData;

/**
 *  上拉加载触发的方法
 */
- (void)loadMoreData;

#pragma mark - ***** other method ******
/**
 *  设置 tableView 的分割线 边距
 */
- (void)configuraTableViewSeparatorInsetZero;
- (void)configuraTableViewSeparatorInset:(UIEdgeInsets)inset;

/**
 *  配置tableView右侧的index title 背景颜色，因为在iOS7有白色底色，iOS6没有
 */
- (void)configuraSectionIndexBackgroundClearColor;
@end

