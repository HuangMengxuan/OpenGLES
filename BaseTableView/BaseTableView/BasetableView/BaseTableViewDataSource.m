//
//  BaseTableViewDataSource.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewDataSource.h"

@implementation BaseTableViewDataSource

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.itemSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section >= self.itemSections.count) {
        return 0;
    }
    return self.itemSections[section].items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section >= self.itemSections.count) {
        return nil;
    }
    return self.itemSections[section].sectionHeaderTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section >= self.itemSections.count) {
        return nil;
    }
    return self.itemSections[section].sectionFooterTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = NULL;
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellClassForIndexPath:)]) {
        cellClass = [self.delegate cellClassForIndexPath:indexPath];
    }
    
    if (cellClass == NULL || ![cellClass isSubclassOfClass:[BaseTableViewCell class]]) {
        cellClass = [BaseTableViewCell class];
    }
    
    BaseTableViewCell *cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

@end
