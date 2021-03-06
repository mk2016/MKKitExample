//
//  MKBaseTableViewCell.m
//  MKKitExample
//
//  Created by xmk on 2017/2/13.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBaseTableViewCell.h"

@implementation MKBaseTableViewCell


+ (instancetype)cellWithDefaultStyleTableView:(UITableView *)tableView{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    return [self cellWithStyle:UITableViewCellStyleDefault resuseIdentifier:reuseIdentifier tableView:tableView];
}

+ (instancetype)cellWithDefaultStyleAndReuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView{
    return [self cellWithStyle:UITableViewCellStyleDefault resuseIdentifier:reuseIdentifier tableView:tableView];
}

+ (instancetype)cellWithStyle:(UITableViewCellStyle)style tableView:(UITableView *)tableView{
    NSString *identifier = NSStringFromClass([self class]);
    return [self cellWithStyle:style resuseIdentifier:identifier tableView:tableView];
}

+ (instancetype)cellWithStyle:(UITableViewCellStyle)style resuseIdentifier:(NSString *)identifier tableView:(UITableView *)tableView{
    MKBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView.backgroundColor = MKCOLOR_HEX(0xF0EFF0);
        [self setupUI];
    }
    return self;
}

/** create cell by nib */
+ (instancetype)cellByNibWith:(UITableView *)tableView{
    NSString *className = NSStringFromClass([self class]);
    Class class = NSClassFromString(className);
    MKBaseTableViewCell *cell;
    if (class) {
        cell = [tableView dequeueReusableCellWithIdentifier:className];
    }
    if (!cell) {
        UINib *_nib = [UINib nibWithNibName:className bundle:nil];
        if (_nib) {
            cell = [[_nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
        }
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

/** setup UI */
- (void)setupUI{
    // implementation in sub class
}

- (void)refreshUIWithModel:(id)model{
    
}

/** cell height */
+ (CGFloat)getCellHeight{
    return 44;
}

+ (CGFloat)getCellHeightWithModel:(id)model{
    return 44;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
