//
//  BaseTableViewItemSection.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewItemSection.h"

@interface BaseTableViewItemSection ()

@property (nonatomic, readwrite, strong) NSMutableArray<BaseTableViewItem *> *items;

@end

@implementation BaseTableViewItemSection

- (instancetype)init {
    if (self = [super init]) {
        self.items = @[].mutableCopy;
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
