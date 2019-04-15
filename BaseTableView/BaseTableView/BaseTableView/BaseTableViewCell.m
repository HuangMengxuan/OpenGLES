//
//  BaseTableViewCell.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BaseTableViewItem.h"

@implementation BaseTableViewCell

- (void)setCellObject:(BaseTableViewItem *)cellObject {
    [self.imageView setImage:cellObject.itemImage];
    self.textLabel.text = cellObject.itemTitle;
    self.detailTextLabel.text = cellObject.itemSubTitle;
    self.accessoryView = cellObject.itemAccessoryView;
}

+ (CGFloat)rowHeightForCellObject:(BaseTableViewItem *)cellObject {
    return 44.0f;
}

@end
