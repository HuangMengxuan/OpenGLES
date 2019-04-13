//
//  HMXFakeTableViewDataSourceDelegateConfromal.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXFakeTableViewDataSourceDelegateConfromal.h"

@implementation HMXFakeTableViewDataSourceDelegateConfromal

- (void)tableViewDataSourceChanged:(HMXTableViewDataSource *)tableViewDataSource {
    self.calledTableViewDataSourceChanged = YES;
}

- (void)tableViewDataSource:(HMXTableViewDataSource *)tableViewDataSource didSelectIndexPath:(NSIndexPath *)indexPath {
    self.calledTableViewDataSourceDidSelectIndexPath = YES;
    self.selectedIndexPath = indexPath;
}

@end
