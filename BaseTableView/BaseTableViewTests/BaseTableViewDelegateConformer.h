//
//  BaseTableViewDelegateConformer.h
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/19.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewDelegateConformer : NSObject <BaseTableViewDelegate>

@property (nonatomic, strong) BaseTableViewItem *cellObject;
@property (nonatomic, assign) BOOL calledDidSelectCellObject;
@property (nonatomic, assign) BOOL calledDidSelectRowAtIndexPath;

@end

NS_ASSUME_NONNULL_END
