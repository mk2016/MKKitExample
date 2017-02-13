//
//  MKBaseTableViewCell.h
//  MKKitExample
//
//  Created by xmk on 2017/2/13.
//  Copyright © 2017年 mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKBaseTableViewCell : UITableViewCell

/** create cell */
+ (instancetype)cellWithDefaultStyleTableView:(UITableView *)tableView;
+ (instancetype)cellWithDefaultStyleAndReuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView;
+ (instancetype)cellWithStyle:(UITableViewCellStyle)style tableView:(UITableView *)tableView;

/** create cell by nib */
+ (instancetype)cellByNibWith:(UITableView *)tableView;

/** setup UI */
- (void)setupUI;
- (void)refreshUIWithModel:(id)model;

/** get cell height */
+ (CGFloat)getCellHeight;
+ (CGFloat)getCellHeightWithModel:(id)model;

@end
