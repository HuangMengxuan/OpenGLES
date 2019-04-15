//
//  BaseTableViewDataSource.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewDataSource.h"
#import "BaseTableViewCell.h"

@implementation BaseTableViewDataSource

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.itemSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.itemSections.count <= section) {
        return 0;
    }
    return self.itemSections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewItem *item = [self cellObjectForIndexPath:indexPath];
    
    Class class = [self cellClassForIndexPath:indexPath];
    NSString *cellIdentififer = [NSString stringWithUTF8String:object_getClassName(class)];
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentififer];
    
    // 确保cell的类型为BaseTableViewCell或其子类
    if (![class isKindOfClass:[BaseTableViewCell class]]) {
//        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentififer];
        class = [BaseTableViewCell class];
    }
    
    if (!cell) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentififer];
    }
    
    cell.cellObject = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.itemSections.count <= section) {
        return nil;
    }
    return self.itemSections[section].sectionHeaderTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.itemSections.count <= section) {
        return nil;
    }
    return self.itemSections[section].sectionFooterTitle;
}

#pragma mark - Public Methods
- (void)appendItems:(NSArray<BaseTableViewItem *> *)items {
    [self appendItems:items forSectionIndex:0];
}

- (void)appendItems:(NSArray<BaseTableViewItem *> *)items forSectionIndex:(NSUInteger)sectionIndex {
    if (self.itemSections.count >= sectionIndex) {
        return;
    }
    
    BaseTableViewItemSection *section = self.itemSections[sectionIndex];
    [section.items addObjectsFromArray:items];
}

- (void)clearAllItemSections {
    [self.itemSections removeAllObjects];
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath {
    return [BaseTableViewCell class];
}

- (BaseTableViewItem *)cellObjectForIndexPath:(NSIndexPath *)indexPath {
    if (self.itemSections.count > indexPath.section &&
        self.itemSections[indexPath.section].items.count > indexPath.row) {
        return self.itemSections[indexPath.section].items[indexPath.row];
    }
    return nil;
}

#pragma mark - Properties
- (NSMutableArray<BaseTableViewItemSection *> *)itemSections {
    if (!_itemSections) {
        _itemSections = @[].mutableCopy;
    }
    return _itemSections;
}

@end
