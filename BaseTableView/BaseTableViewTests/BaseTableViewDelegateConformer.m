//
//  BaseTableViewDelegateConformer.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewDelegateConformer.h"

@implementation BaseTableViewDelegateConformer

- (void)tableView:(BaseTableView *)tableView didSelectCellObject:(BaseTableViewItem *)cellObject atIndexPath:(NSIndexPath *)indexPath {
    self.calledDidSelectCellObject = YES;
    self.cellObject = cellObject;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.calledDidSelectRowAtIndexPath = YES;
}

@end
