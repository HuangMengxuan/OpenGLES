//
//  HMXTableViewDataSource.h
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMXTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HMXTableViewDataSourceDelegate;

@interface HMXTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<HMXTableViewDataSourceDelegate> delegate;
@property (nonatomic, copy) NSArray *dataArray;

@end

@protocol HMXTableViewDataSourceDelegate <NSObject>

@optional
- (void)tableViewDataSourceChanged:(HMXTableViewDataSource *)tableViewDataSource;
- (void)tableViewDataSource:(HMXTableViewDataSource *)tableViewDataSource didSelectIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
