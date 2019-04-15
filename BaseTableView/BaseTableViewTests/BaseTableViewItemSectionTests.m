//
//  BaseTableViewItemSectionTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewItemSection.h"

@interface BaseTableViewItemSectionTests : XCTestCase

@end

/**
 1.1 可以创建BaseTableViewItemSection对象
 1.2 通过initWithItems:方法可以创建BaseTableViewItemSection对象
 1.2 通过initWithHeaderTitle:footerTitle:items:方法可以创建BaseTableViewItemSection对象
 
 2.1 可以设置sectionHeaderTitle属性
 2.2 可以设置sectionFooterTitle属性
 
 3.1 创建的BaseTableViewItemSection对象的items不为nil
 */
@implementation BaseTableViewItemSectionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_BaseTableViewItemSection_Is_Exist {
    XCTAssertNotNil([BaseTableViewItemSection new], @"可以创建BaseTableViewItemSection对象");
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
    XCTAssertTrue([headerTitle isEqualToString:section.sectionHeaderTitle], @"items属性一致");
    XCTAssertTrue([footerTitle isEqualToString:section.sectionFooterTitle], @"items属性一致");
    XCTAssertEqualObjects(items, section.items, @"items属性一致");
}

- (void)test_Set_sectionHeaderTitle_Valid {
    NSString *headerTitle = @"headerTitle";
    
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    section.sectionHeaderTitle = headerTitle;
    
    XCTAssertTrue([section.sectionHeaderTitle isEqualToString:headerTitle], @"可以设置sectionHeaderTitle属性");
}

- (void)test_Set_sectionFooterTitle_Valid {
    NSString *footerTitle = @"footerTitle";
    
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    section.sectionFooterTitle = footerTitle;
    
    XCTAssertTrue([section.sectionFooterTitle isEqualToString:footerTitle], @"可以设置sectionFooterTitle属性");
}

- (void)test_BaseTableViewItemSection_Property_items_Should_Not_Be_Nil {
    BaseTableViewItemSection *section1 = [BaseTableViewItemSection new];
    XCTAssertNotNil(section1.items, @"创建的BaseTableViewItemSection对象的items不为nil");
    
    BaseTableViewItemSection *section2 = [[BaseTableViewItemSection alloc] initWithItems:nil];
    XCTAssertNotNil(section2.items, @"创建的BaseTableViewItemSection对象的items不为nil");
    
    BaseTableViewItemSection *section3 = [[BaseTableViewItemSection alloc] initWithHeaderTitle:@"" footerTitle:@"" items:@[]];
    XCTAssertNotNil(section3.items, @"创建的BaseTableViewItemSection对象的items不为nil");
}

@end
