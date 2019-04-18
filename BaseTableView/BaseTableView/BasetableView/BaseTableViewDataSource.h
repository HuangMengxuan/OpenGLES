//
//  BaseTableViewDataSource.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewItemSection.h"
#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewDataSourceDelegate;

@interface BaseTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id<BaseTableViewDataSourceDelegate> delegate;

@property (nonatomic, strong) NSMutableArray<BaseTableViewItemSection *> *itemSections;

- (BaseTableViewItem *)cellObjectForIndexPath:(NSIndexPath *)indexPath;

@end

@protocol BaseTableViewDataSourceDelegate <NSObject>

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
