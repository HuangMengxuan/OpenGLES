//
//  BaseTableViewDataSourceDelegateConformer.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewDataSourceDelegateConformer.h"

@implementation BaseTableViewDataSourceDelegateConformer

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath {
    return self.cellClass;
}

@end
