//
//  HMXFakeTableViewDataSourceDelegateConfromal.h
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMXTableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMXFakeTableViewDataSourceDelegateConfromal : NSObject <HMXTableViewDataSourceDelegate>

@property (nonatomic, assign) BOOL calledTableViewDataSourceChanged;
@property (nonatomic, assign) BOOL calledTableViewDataSourceDidSelectIndexPath;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

NS_ASSUME_NONNULL_END
