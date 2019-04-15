//
//  BaseTableViewDataSource.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewItemSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<BaseTableViewItemSection *> *itemSections;

- (void)appendItems:(NSArray<BaseTableViewItem *> *)items;
- (void)appendItems:(NSArray<BaseTableViewItem *> *)items forSectionIndex:(NSUInteger)sectionIndex;
- (void)clearAllItemSections;

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath;
- (BaseTableViewItem *)cellObjectForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
