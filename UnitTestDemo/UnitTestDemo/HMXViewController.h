//
//  HMXViewController.h
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMXViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) id<UITableViewDelegate, UITableViewDataSource> dataSource;

@end

NS_ASSUME_NONNULL_END
