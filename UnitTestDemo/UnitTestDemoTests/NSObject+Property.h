//
//  NSObject+Property.h
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)

+ (NSString *)nameForProperty:(NSString *)propertyName objectClass:(Class)objectClass;
+ (NSString *)typeForProperty:(NSString *)propertyName objectClass:(Class)objectClass;

@end

NS_ASSUME_NONNULL_END
