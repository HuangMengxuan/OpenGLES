//
//  NSObject+Property.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

+ (NSString *)nameForProperty:(NSString *)propertyName objectClass:(Class)objectClass {
    objc_property_t property = class_getProperty(objectClass, propertyName.UTF8String);
    if (property == NULL) {
        return nil;
    }
    
    const char *name = property_getName(property);
    return [NSString stringWithUTF8String:name];
}

/**
 根据属性名获取属性的类型
 id<UITableViewDelegate, UITableViewDataSource> -> <UITableViewDelegate><UITableViewDataSource>
 UITableView -> UITableView
 block -> Block:propertyName

 @param propertyName 属性名
 @param objectClass 所在的类
 @return 属性类型
 */
+ (NSString *)typeForProperty:(NSString *)propertyName objectClass:(Class)objectClass {
    objc_property_t property = class_getProperty(objectClass, propertyName.UTF8String);
    
    if (property == NULL) {
        return nil;
    }
    
    NSString *typeName = nil;
    
    uint attributeCount = 0;
    objc_property_attribute_t * attributeList = property_copyAttributeList(property, &attributeCount);
    for (uint j = 0; j < attributeCount; j++) {
        objc_property_attribute_t attribute = attributeList[j];
        NSString *name = [NSString stringWithUTF8String:attribute.name];
        
        if ([name isEqualToString:@"T"]) {
            typeName = [NSString stringWithUTF8String:attribute.value];
            break;
        }
    }
    
    if (typeName == nil) {
        return typeName;
    }
    
    if ([typeName hasPrefix:@"@\""]) {
        typeName = [typeName substringWithRange:NSMakeRange(2, typeName.length - 3)];
    } else if ([typeName hasPrefix:@"@?"]) {
        typeName = [NSString stringWithFormat:@"Block:%@", propertyName];
    }
    return typeName;
}

@end
