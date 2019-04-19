//
//  BaseTableViewDataSourceDelegateConformer.h
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewDataSourceDelegateConformer : NSObject <BaseTableViewDataSourceDelegate>

@property (nonatomic, assign) Class cellClass;

@end

NS_ASSUME_NONNULL_END
