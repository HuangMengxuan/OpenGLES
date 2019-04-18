//
//  BaseTableViewItemSectionTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewItemSection.h"
#import "NSObject+Property.h"

@interface BaseTableViewItemSectionTests : XCTestCase

@end

/**
 2.1.1 BaseTableViewItemSection存在成员变量sectionHeaderTitle
 2.1.2 BaseTableViewItemSection的成员变量sectionHeaderTitle类型为NSString
 2.1.3 BaseTableViewItemSection的成员变量sectionHeaderTitle使用copy
 2.1.4 BaseTableViewItemSection存在成员变量sectionFooterTitle
 2.1.5 BaseTableViewItemSection的成员变量sectionFooterTitle类型为NSString
 2.1.6 BaseTableViewItemSection的成员变量sectionFooterTitle使用copy
 2.1.7 BaseTableViewItemSection存在成员变量items
 2.1.8 BaseTableViewItemSection的成员变量items类型为NSMutableArray
 2.1.9 BaseTableViewItemSection的成员变量items使用readonly
 
 2.2.1 通过initWithItems:方法可以创建BaseTableViewItemSection对象，并且新的BaseTableViewItemSection对象的成员变量的值与传入的值一致
 2.2.2 通过initWithHeaderTitle:footerTitle:items:方法可以创建BaseTableViewItemSection对象，并且新的BaseTableViewItemSection对象的成员变量的值与传入的值一致
 
 2.3.1 创建的BaseTableViewItemSection对象的items不为nil
 */
@implementation BaseTableViewItemSectionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Exist_Property_sectionHeaderTitle {
    NSString *propertyName = [NSObject nameForProperty:@"sectionHeaderTitle" objectClass:[BaseTableViewItemSection class]];
    
    XCTAssertTrue([propertyName isEqualToString:@"sectionHeaderTitle"], @"BaseTableViewItemSection存在成员变量sectionHeaderTitle");
}

- (void)test_Property_sectionHeaderTitle_Type_Is_NSString {
    NSString *propertyType = [NSObject typeForProperty:@"sectionHeaderTitle" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue([propertyType isEqualToString:@"NSString"], @"BaseTableViewItemSection的成员变量sectionHeaderTitle类型为NSString");
}

- (void)test_Property_sectionHeaderTitle_Exist_Attribute_copy {
    BOOL isCopy = [NSObject isCopyForProperty:@"sectionHeaderTitle" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue(isCopy, @"BaseTableViewItemSection的成员变量sectionFooterTitle使用copy");
}

- (void)test_Exist_Property_sectionFooterTitle {
    NSString *propertyName = [NSObject nameForProperty:@"sectionFooterTitle" objectClass:[BaseTableViewItemSection class]];
    
    XCTAssertTrue([propertyName isEqualToString:@"sectionFooterTitle"], @"BaseTableViewItemSection存在成员变量sectionFooterTitle");
}

- (void)test_Property_sectionFooterTitle_Type_Is_NSString {
    NSString *propertyType = [NSObject typeForProperty:@"sectionFooterTitle" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue([propertyType isEqualToString:@"NSString"], @"BaseTableViewItemSection的成员变量sectionFooterTitle类型为NSString");
}

- (void)test_Property_sectionFooterTitle_Exist_Attribute_copy {
    BOOL isCopy = [NSObject isCopyForProperty:@"sectionFooterTitle" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue(isCopy, @"BaseTableViewItemSection的成员变量sectionFooterTitle使用copy");
}

- (void)test_Exist_Property_items {
    NSString *propertyName = [NSObject nameForProperty:@"items" objectClass:[BaseTableViewItemSection class]];
    
    XCTAssertTrue([propertyName isEqualToString:@"items"], @"BaseTableViewItemSection存在成员变量items");
}

- (void)test_Property_items_Type_Is_NSMutableArray {
    NSString *propertyType = [NSObject typeForProperty:@"items" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue([propertyType isEqualToString:@"NSMutableArray"], @"BaseTableViewItemSection的成员变量items类型为NSMutableArray");
}

- (void)test_Property_items_Exist_Attribute_Readonly {
    BOOL isReadonly = [NSObject isReadOnlyForProperty:@"items" objectClass:[BaseTableViewItemSection class]];
    XCTAssertTrue(isReadonly, @"BaseTableViewItemSection的成员变量items使用readonly");
}

- (void)test_Method_initWithItems_Valid {
    NSArray *items = @[];
    BaseTableViewItemSection *section = [[BaseTableViewItemSection alloc] initWithItems:items];
    XCTAssertEqualObjects(items, section.items, @"items属性一致");
}

- (void)test_Method_initWithHeaderTitle_footerTitle_items_Valid {
    NSString *headerTitle = @"headerTitle";
    NSString *footerTitle = @"footerTitle";
    NSArray *items = @[];
    BaseTableViewItemSection *section = [[BaseTableViewItemSection alloc] initWithHeaderTitle:headerTitle footerTitle:footerTitle items:items];
    XCTAssertTrue([headerTitle isEqualToString:section.sectionHeaderTitle], @"sectionHeaderTitle属性一致");
    XCTAssertTrue([footerTitle isEqualToString:section.sectionFooterTitle], @"sectionFooterTitle属性一致");
    XCTAssertEqualObjects(items, section.items, @"items属性一致");
}

- (void)test_Property_items_Should_Not_Be_Nil {
    BaseTableViewItemSection *section1 = [BaseTableViewItemSection new];
    XCTAssertNotNil(section1.items, @"创建的BaseTableViewItemSection对象的items不为nil");
    
    BaseTableViewItemSection *section2 = [[BaseTableViewItemSection alloc] initWithItems:nil];
    XCTAssertNotNil(section2.items, @"创建的BaseTableViewItemSection对象的items不为nil");
    
    BaseTableViewItemSection *section3 = [[BaseTableViewItemSection alloc] initWithHeaderTitle:@"" footerTitle:@"" items:@[]];
    XCTAssertNotNil(section3.items, @"创建的BaseTableViewItemSection对象的items不为nil");
}

@end
