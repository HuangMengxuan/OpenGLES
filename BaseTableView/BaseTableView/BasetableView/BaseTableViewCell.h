//
//  BaseTableViewCell.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BaseTableViewItem;

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, strong) BaseTableViewItem *cellObject;

@end

NS_ASSUME_NONNULL_END
