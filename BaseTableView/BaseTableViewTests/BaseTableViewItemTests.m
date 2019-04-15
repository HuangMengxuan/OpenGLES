//
//  BaseTableViewItemTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewItem.h"

@interface BaseTableViewItemTests : XCTestCase

@end

/**
 1.1 可以创建BaseTableViewItem对象
 1.2 通过initWithTitle:subTitle:image:方法可以创建BaseTableViewItem对象
 1.3 通过initWithTitle:subTitle:placehoderImage:image:方法可以创建BaseTableViewItem对象
 1.4 通过initWithTitle:subTitle:image:accessoryView:方法可以创建BaseTableViewItem对象
 1.5 通过initWithTitle:subTitle:placehoderImage:image:accessoryView:方法可以创建BaseTableViewItem对象
 
 2.1 可以设置itemTitle属性
 2.2 可以设置itemSubTitle属性
 2.3 可以设置itemPlacehoderImage属性
 2.4 可以设置itemImage属性
 2.5 可以设置itemAccessoryView属性
 
 */
@implementation BaseTableViewItemTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)test_BaseTableViewItem_Is_Exist {
    XCTAssertNotNil([BaseTableViewItem new], @"可以创建BaseTableViewItem对象");
}

- (void)test_Method_initWithTitle_subTitle_image_Valid {
    UIImage *image = [UIImage new];
    NSString *title = @"title";
    NSString *subTitle = @"subTitle";
    BaseTableViewItem *item = [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle image:image];
    XCTAssertNotNil(item, @"通过initWithTitle:subTitle:image:方法可以创建BaseTableViewItem对象");
    
    XCTAssertEqualObjects(title, item.itemTitle, @"title属性一致");
    XCTAssertEqualObjects(subTitle, item.itemSubTitle, @"subTitle属性一致");
    XCTAssertEqualObjects(image, item.itemImage, @"image属性一致");
}

- (void)test_Method_initWithTitle_subTitle_placehoderImage_image_Valid {
    NSString *title = @"title";
    NSString *subTitle = @"subTitle";
    UIImage *placeholderImage = [UIImage new];
    UIImage *image = [UIImage new];
    
    BaseTableViewItem *item = [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle placeholderImage:placeholderImage image:image];
    XCTAssertNotNil(item, @"通过initWithTitle:subTitle:placehoderImage:image:accessoryView:方法可以创建BaseTableViewItem对象");
    
    XCTAssertEqualObjects(title, item.itemTitle, @"title属性一致");
    XCTAssertEqualObjects(subTitle, item.itemSubTitle, @"subTitle属性一致");
    XCTAssertEqualObjects(placeholderImage, item.itemPlaceholderImage, @"placeholderImage属性一致");
    XCTAssertEqualObjects(image, item.itemImage, @"image属性一致");
}

- (void)test_Method_initWithTitle_subTitle_image_accessoryView_Valid {
    NSString *title = @"title";
    NSString *subTitle = @"subTitle";
    UIImage *image = [UIImage new];
    UIView *accessoryView = [UIView new];
    
    BaseTableViewItem *item = [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle image:image accessoryView:accessoryView];
    XCTAssertNotNil(item, @"通过initWithTitle:subTitle:placehoderImage:image:accessoryView:方法可以创建BaseTableViewItem对象");
    
    XCTAssertEqualObjects(title, item.itemTitle, @"title属性一致");
    XCTAssertEqualObjects(subTitle, item.itemSubTitle, @"subTitle属性一致");
    XCTAssertEqualObjects(image, item.itemImage, @"image属性一致");
    XCTAssertEqualObjects(accessoryView, item.itemAccessoryView, @"accessoryView属性一致");
}

- (void)test_Method_initWithTitle_subTitle_placehoderImage_image_accessoryView_Valid {
    NSString *title = @"title";
    NSString *subTitle = @"subTitle";
    UIImage *placeholderImage = [UIImage new];
    UIImage *image = [UIImage new];
    UIView *accessoryView = [UIView new];
    
    BaseTableViewItem *item = [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle placeholderImage:placeholderImage image:image accessoryView:accessoryView];
    XCTAssertNotNil(item, @"通过initWithTitle:subTitle:placehoderImage:image:accessoryView:方法可以创建BaseTableViewItem对象");
    
    XCTAssertEqualObjects(title, item.itemTitle, @"title属性一致");
    XCTAssertEqualObjects(subTitle, item.itemSubTitle, @"subTitle属性一致");
    XCTAssertEqualObjects(placeholderImage, item.itemPlaceholderImage, @"placeholderImage属性一致");
    XCTAssertEqualObjects(image, item.itemImage, @"image属性一致");
    XCTAssertEqualObjects(accessoryView, item.itemAccessoryView, @"accessoryView属性一致");
}

- (void)test_Set_itemTitle_Valid {
    NSString *title = @"title";
    
    BaseTableViewItem *item = [BaseTableViewItem new];
    item.itemTitle = title;
    
    XCTAssertTrue([item.itemTitle isEqualToString:title], @"可以设置itemTitle属性");
}

- (void)test_Set_itemSubTitle_Valid {
    NSString *subTitle = @"subTitle";

    BaseTableViewItem *item = [BaseTableViewItem new];
    item.itemSubTitle = subTitle;
    
    XCTAssertTrue([item.itemSubTitle isEqualToString:subTitle], @"可以设置itemSubTitle属性");
}

- (void)test_Set_itemPlacehoderImage_Valid {
    UIImage *placeholderImage = [UIImage new];
    
    BaseTableViewItem *item = [BaseTableViewItem new];
    item.itemPlaceholderImage = placeholderImage;

    XCTAssertTrue([item.itemPlaceholderImage isEqual:placeholderImage], @"可以设置itemPlaceholderImage属性");
}

- (void)test_Set_itemImage_Valid {
    UIImage *image = [UIImage new];
    
    BaseTableViewItem *item = [BaseTableViewItem new];
    item.itemImage = image;
    
    XCTAssertTrue([item.itemImage isEqual:image], @"可以设置itemImage属性");
}

- (void)test_Set_itemAccessoryView_Valid {
    UIView *accessoryView = [UIView new];
    
    BaseTableViewItem *item = [BaseTableViewItem new];
    item.itemAccessoryView = accessoryView;
    
    XCTAssertTrue([item.itemAccessoryView isEqual:accessoryView], @"可以设置itemAccessoryView属性");
}

@end
