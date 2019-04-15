//
//  BaseTableView.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

/**
 1. 拒绝在每次创建TableView的时候，写大量的DataSource和Delegate的重复代码
 2. 将对TableView关于View层的操作，尽量封装在View层，即TableView和Cell
 3. 
 */

@class BaseTableViewItem;
@protocol BaseTableViewDelegate;

@interface BaseTableView : UITableView

@property (nonatomic, strong) BaseTableViewDataSource *baseDataSource;
@property (nonatomic, weak) id<BaseTableViewDelegate> baseDelegate;

@end

@protocol BaseTableViewDelegate <UITableViewDelegate>

@optional
- (void)tableView:(BaseTableView *)tableView didSelectCellObject:(BaseTableViewItem *)cellObject atIndexPath:(NSIndexPath *)indexPath;
- (void)tableview:(BaseTableView *)tableView headerViewForItemSection:(BaseTableViewItemSection *)itemSection inSection:(NSInteger)section;
- (void)tableview:(BaseTableView *)tableView footerViewForItemSection:(BaseTableViewItemSection *)itemSection inSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
