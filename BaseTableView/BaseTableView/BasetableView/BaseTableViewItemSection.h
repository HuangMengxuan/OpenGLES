//
//  BaseTableViewItemSection.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewItemSection : NSObject

@property (nonatomic, copy) NSString *sectionHeaderTitle;
@property (nonatomic, copy) NSString *sectionFooterTitle;
@property (nonatomic, readonly, strong) NSMutableArray<BaseTableViewItem *> *items;

- (instancetype)initWithItems:(NSArray<BaseTableViewItem *> *)items;
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle items:(NSArray<BaseTableViewItem *> *)items;

@end

NS_ASSUME_NONNULL_END
