//
//  HMXModel.h
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/8.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HMXModelType) {
    HMXModelTypeA = 1,
    HMXModelTypeB = 2,
    HMXModelTypeC = 3,
};

@interface HMXModel : NSObject

@property (nonatomic, assign) HMXModelType type;
@property (nonatomic, copy) NSString *title;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithModelType:(HMXModelType)modelType title:(NSString *)title;
+ (instancetype)modelWithModelType:(HMXModelType)modelType title:(NSString *)title;

+ (NSArray<HMXModel *> *)models;

@end

NS_ASSUME_NONNULL_END
