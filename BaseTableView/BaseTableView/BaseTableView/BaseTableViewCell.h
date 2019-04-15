//
//  BaseTableViewCell.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableViewItem;

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, strong) BaseTableViewItem *cellObject;

+ (CGFloat)rowHeightForCellObject:(BaseTableViewItem *)cellObject;

@end

NS_ASSUME_NONNULL_END
