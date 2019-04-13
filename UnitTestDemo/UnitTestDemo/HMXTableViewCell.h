//
//  HMXTableViewCell.h
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMXModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMXTableViewCell : UITableViewCell

@property (strong, nonatomic) HMXModel *model;

+ (NSString *)cellIdentifier;

@end

NS_ASSUME_NONNULL_END
