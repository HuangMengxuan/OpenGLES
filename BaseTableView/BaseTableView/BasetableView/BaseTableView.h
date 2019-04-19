//
//  BaseTableView.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewDelegate;

@interface BaseTableView : UITableView <UITableViewDelegate>

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
