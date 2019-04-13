//
//  HMXModel.m
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/8.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXModel.h"

@implementation HMXModel

- (instancetype)initWithModelType:(HMXModelType)modelType title:(NSString *)title {
    if (self = [super init]) {
        self.type = modelType;
        self.title = title;
    }
    return self;
}

+ (instancetype)modelWithModelType:(HMXModelType)modelType title:(NSString *)title {
    return [[HMXModel alloc] initWithModelType:modelType title:title];
}

+ (NSArray<HMXModel *> *)models {
    NSArray *models = @[
                        [HMXModel modelWithModelType:HMXModelTypeA title:@"Type A"],
                        [HMXModel modelWithModelType:HMXModelTypeB title:@"Type B"],
                        [HMXModel modelWithModelType:HMXModelTypeC title:@"Type C"],
                        ];
    
    return models;
}

- (void)setType:(HMXModelType)type {
    if (type != HMXModelTypeA && type != HMXModelTypeB && type != HMXModelTypeC) {
        if (_type == 0) {
            _type = HMXModelTypeA;
        }
        return;
    }
    
    _type = type;
}

@end
