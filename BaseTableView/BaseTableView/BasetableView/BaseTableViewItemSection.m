//
//  BaseTableViewItemSection.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewItemSection.h"

@implementation BaseTableViewItemSection

- (instancetype)init {
    if (self = [super init]) {
        _items = @[].mutableCopy;
    }
    return self;
}

- (instancetype)initWithItems:(NSArray<BaseTableViewItem *> *)items {
    if (self = [self init]) {
        [self.items addObjectsFromArray:items];
    }
    return self;
}

- (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle items:(NSArray<BaseTableViewItem *> *)items {
    if (self = [self init]) {
        self.sectionHeaderTitle = headerTitle;
        self.sectionFooterTitle = footerTitle;
        [self.items addObjectsFromArray:items];
    }
    return self;
}

@end
