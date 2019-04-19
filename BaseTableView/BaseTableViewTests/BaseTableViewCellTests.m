//
//  BaseTableViewCellTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewCell.h"
#import "BaseTableViewItem.h"

@interface BaseTableViewCellTests : XCTestCase

@end

/**
 5.1.1 BaseTableViewCell是UITableViewCell的子类
 5.1.2 BaseTableViewCell拥有成员变量cellObject
 5.1.3 成员变量cellObject的类型为BaseTableViewItem
 
 5.2.1 BaseTableViewCell实现了类方法rowHeightForCellObject:
 5.2.2 BaseTableViewCell的类方法rowHeightForCellObject:返回默认值44.0f
 */
@implementation BaseTableViewCellTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}

#pragma mark - 5.2.*
- (void)test_Exist_Method_rowHeightForCellObject {
    XCTAssertTrue([BaseTableViewCell respondsToSelector:@selector(rowHeightForCellObject:)],
                  @"BaseTableViewCell实现方法rowHeightForCellObject:");
}

- (void)test_Method_rowHeightForCellObject_Returns_44 {
    CGFloat rowHeight = [BaseTableViewCell rowHeightForCellObject:[BaseTableViewItem new]];
    XCTAssertEqual(rowHeight, 44.0f, @"BaseTableViewCell的类方法rowHeightForCellObject:返回默认值44.0f");
}

@end
