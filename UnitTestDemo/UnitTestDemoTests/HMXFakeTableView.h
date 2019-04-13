//
//  HMXFakeTableView.h
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/11.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMXFakeTableView : UITableView

@property (nonatomic, assign) BOOL didCallReloadData;

@end

NS_ASSUME_NONNULL_END
