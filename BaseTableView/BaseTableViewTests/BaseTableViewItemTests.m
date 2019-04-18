//
//  BaseTableViewItemTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewItem.h"
#import "NSObject+Property.h"

@interface BaseTableViewItemTests : XCTestCase

@end

/**
 1.1.1 BaseTableViewItem存在成员变量itemTitle
 1.1.2 BaseTableViewItem的成员变量itemTitle类型为NSString
 1.1.3 BaseTableViewItem的成员变量itemTitle使用copy
 1.1.4 BaseTableViewItem存在成员变量itemSubTitle
 1.1.5 BaseTableViewItem的成员变量itemSubTitle类型为NSString
 1.1.6 BaseTableViewItem的成员变量itemSubTitle使用copy
 1.1.7 BaseTableViewItem存在成员变量itemImage
 1.1.8 BaseTableViewItem的成员变量itemImage类型为UIImage
 1.1.9 BaseTableViewItem存在成员变量itemAccessoryView
 1.1.10 BaseTableViewItem的成员变量itemAccessoryView类型为UIView
 1.1.11 BaseTableViewItem存在成员变量cellHeight
 
 1.2.1 通过initWithTitle:方法可以创建BaseTableViewItem对象，并且新的BaseTableViewItem对象的成员变量的值与传入的值一致
 1.2.2 通过initWithTitle:image:方法可以创建BaseTableViewItem对象，并且新的BaseTableViewItem对象的成员变量的值与传入的值一致
 1.2.3 通过initWithTitle:subTitle:image:方法可以创建BaseTableViewItem对象，并且新的BaseTableViewItem对象的成员变量的值与传入的值一致
 1.2.4 通过initWithTitle:subTitle:image:accessoryView:方法可以创建BaseTableViewItem对象，并且新的BaseTableViewItem对象的成员变量的值与传入的值一致
 
 */
@implementation BaseTableViewItemTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)test_Exist_Property_itemTitle {
    NSString *propertyName = [NSObject nameForProperty:@"itemTitle" objectClass:[BaseTableViewItem class]];
    
    XCTAssertTrue([propertyName isEqualToString:@"itemTitle"], @"BaseTableViewItem存在成员变量itemTitle");
}

- (void)test_Property_itemTitle_Type_Is_NSString {
    NSString *propertyType = [NSObject typeForProperty:@"itemTitle" objectClass:[BaseTableViewItem class]];
    XCTAssertTrue([propertyType isEqualToString:@"NSString"], @"BaseTableViewItem的成员变量itemTitle类型为NSString");
}

- (void)test_Property_itemTitle_Exist_Attribute_copy {
    BOOL isCopy = [NSObject isCopyForProperty:@"itemTitle" objectClass:[BaseTableViewItem class]];
    XCTAssertTrue(isCopy, @"BaseTableViewItem的成员变量itemTitle使用copy");
}

- (void)test_Exist_Method_initWithTitle_subTitle_image_accessoryView {
    NSString *title = @"title";
    NSString *subTitle = @"subTitle";
    UIImage *image = [UIImage new];
    UIView *accessoryView = [UIView new];
    
    BaseTableViewItem *item = [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle image:image accessoryView:accessoryView];
    
    XCTAssertEqualObjects(title, item.itemTitle, @"title属性一致");
    XCTAssertEqualObjects(subTitle, item.itemSubTitle, @"subTitle属性一致");
    XCTAssertEqualObjects(image, item.itemImage, @"image属性一致");
    XCTAssertEqualObjects(accessoryView, item.itemAccessoryView, @"accessoryView属性一致");
    XCTAssertEqual(BaseCellInvalidHeight, item.cellHeight, @"cellHeight的默认值是BaseCellInvalidHeight");
}

@end
