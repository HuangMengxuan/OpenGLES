//
//  HMXFakeTableView.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/11.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXFakeTableView.h"

@implementation HMXFakeTableView

- (void)reloadData {
    [super reloadData];
    
    self.didCallReloadData = YES;
}

@end
