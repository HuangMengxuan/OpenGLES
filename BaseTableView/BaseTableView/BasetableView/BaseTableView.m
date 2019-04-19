//
//  BaseTableView.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.separatorColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.sectionHeaderHeight = 0.01f;
        self.sectionFooterHeight = 0.01f;
        self.delegate = self;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.rowHeight > 0.0f) {
        return self.rowHeight;
    }
    
    
    BaseTableViewItem *item = [self.baseDataSource cellObjectForIndexPath:indexPath];
    Class cellClass = NULL;
    if (self.baseDataSource.delegate &&
        [self.baseDataSource.delegate respondsToSelector:@selector(cellClassForIndexPath:)]) {
        cellClass = [self.baseDataSource.delegate cellClassForIndexPath:indexPath];
    }
    
    if (![cellClass isSubclassOfClass:[BaseTableViewCell class]]) {
        cellClass = [BaseTableViewCell class];
    }
    
    if (item.cellHeight == BaseCellInvalidHeight) {
        item.cellHeight = [cellClass rowHeightForCellObject:item];
    }
    return item.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableView:didSelectCellObject:atIndexPath:)]) {
        BaseTableViewItem *item = [self.baseDataSource cellObjectForIndexPath:indexPath];
        [self.baseDelegate tableView:self didSelectCellObject:item atIndexPath:indexPath];
    } else if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.baseDelegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.baseDataSource.itemSections.count <= section) {
        return nil;
    }
    
    if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableview:headerViewForItemSection:inSection:)]) {
        BaseTableViewItemSection *itemSection = self.baseDataSource.itemSections[section];
        [self.baseDelegate tableview:self headerViewForItemSection:itemSection inSection:section];
    } else if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        [self.baseDelegate tableView:self viewForHeaderInSection:section];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.baseDataSource.itemSections.count <= section) {
        return nil;
    }
    
    if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableview:footerViewForItemSection:inSection:)]) {
        BaseTableViewItemSection *itemSection = self.baseDataSource.itemSections[section];
        [self.baseDelegate tableview:self footerViewForItemSection:itemSection inSection:section];
    } else if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        [self.baseDelegate tableView:self viewForFooterInSection:section];
    }
    return nil;
}

#pragma mark - 传递UITableViewDelegate的代理方法
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.baseDelegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        return [self.baseDelegate tableView:self willSelectRowAtIndexPath:indexPath];
    }
    return indexPath;
}

#pragma mark - Properties
- (void)setBaseDataSource:(BaseTableViewDataSource *)baseDataSource {
    if (_baseDataSource == baseDataSource) {
        return;
    }
    
    _baseDataSource = baseDataSource;
    self.dataSource = baseDataSource;
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    super.dataSource = self.baseDataSource;
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    if (delegate != self) {
        return;
    }
    super.delegate = self;
}

@end
