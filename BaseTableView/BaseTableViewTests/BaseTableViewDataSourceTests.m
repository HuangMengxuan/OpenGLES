//
//  BaseTableViewDataSourceTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableViewDataSource.h"
#import "NSObject+Property.h"
#import "BaseTableViewDataSourceDelegateConformer.h"
#import "TestTableViewCell.h"

@interface BaseTableViewDataSourceTests : XCTestCase

@property (nonatomic, assign) Class objectClass;

@property (nonatomic, strong) BaseTableViewDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

/**
 3.1.1 BaseTableViewDataSource遵循UITableViewDataSource协议
 3.1.2 BaseTableViewDataSource有成员变量itemSections
 3.1.3 成员变量itemSections的类型为NSMutableArray
 3.1.4 BaseTableViewDataSource有成员变量delegate
 3.1.5 成员变量delegate遵循BaseTableViewDataSourceDelegate协议
 
 3.2.1 BaseTableViewDataSource需要实现方法numberOfSectionsInTableView:
 3.2.2 方法numberOfSectionsInTableView:的返回值与itemSections的count数相等
 
 3.3.1 BaseTableViewDataSource需要实现方法tableView:numberOfRowsInSection:
 3.3.2 方法tableView:numberOfRowsInSection:的返回值与itemSections中对应BaseTableViewItemSection中的items的count数相等
 
 3.4.1 BaseTableViewDataSource需要实现方法tableView:titleForHeaderInSection:
 3.4.2 方法tableView:titleForHeaderInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionHeaderTitle一致
 3.4.3 BaseTableViewDataSource需要实现方法tableView:titleForFooterInSection:
 3.4.4 方法tableView:titleForFooterInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionFooterTitle一致
 
 3.5.1 BaseTableViewDataSource需要实现方法tableView:cellForRowAtIndexPath:
 3.5.2 方法tableView:cellForRowAtIndexPath:返回值不为空
 3.5.3 方法tableView:cellForRowAtIndexPath:返回的cell类型是BaseTableViewCell类型或BaseTableViewCell的子类
 3.5.4 方法cellClassForIndexPath:返回的class类型为BaseTableViewCell或其子类类型的时候， 方法tableView:cellForRowAtIndexPath:返回的cell类型与方法cellClassForIndexPath:返回的class类型一致
 3.5.5 方法cellClassForIndexPath:返回的class类型不为BaseTableViewCell或其子类类型的时候， 方法tableView:cellForRowAtIndexPath:返回的cell类型为BaseTableViewCell
 
 3.6.1 在调用方法tableView:cellForRowAtIndexPath:之前，无法获取到可重用cell
 3.6.2 在调用方法tableView:cellForRowAtIndexPath:之后，可以获取到与其返回cell类名为可重用标识符的可重用cell
 
 3.7.1 BaseTableViewDataSource实现方法cellObjectForIndexPath:
 3.7.2 方法cellObjectForIndexPath:返回值与itemSections中对应的BaseTableViewItem一致
 
 3.8.1 方法tableView:cellForRowAtIndexPath:返回的cell的cellObject与方法cellObjectForIndexPath:返回的BaseTableViewItem一致
 */
@implementation BaseTableViewDataSourceTests

- (void)setUp {
    [super setUp];
    
    self.objectClass = [BaseTableViewDataSource class];
    self.dataSource = [BaseTableViewDataSource new];
    self.tableView = [UITableView new];
}

- (void)tearDown {
    self.objectClass = NULL;
    self.dataSource = nil;
    self.tableView = nil;
    
    [super tearDown];
}

#pragma mark - 3.1.*
- (void)test_Conform_UITableViewDataSource {
    XCTAssertTrue([BaseTableViewDataSource conformsToProtocol:@protocol(UITableViewDataSource)],
                  @"BaseTableViewDataSource遵循UITableViewDataSource协议");
}

- (void)test_Exist_Property_itemSections {
    NSString *propertyName = [NSObject nameForProperty:@"itemSections" objectClass:self.objectClass];
    
    XCTAssertTrue([propertyName isEqualToString:@"itemSections"], @"BaseTableViewDataSource存在成员变量itemTitle");
}

- (void)test_Property_itemSections_Type_Is_NSMutableArray {
    NSString *propertyType = [NSObject typeForProperty:@"itemSections" objectClass:self.objectClass];
    XCTAssertTrue([propertyType isEqualToString:@"NSMutableArray"], @"BaseTableViewDataSource的成员变量itemSections类型为NSMutableArray");
}

- (void)test_Exist_Property_delegate {
    NSString *propertyName = [NSObject nameForProperty:@"delegate" objectClass:self.objectClass];
    
    XCTAssertTrue([propertyName isEqualToString:@"delegate"], @"BaseTableViewDataSource存在成员变量delegate");
}

- (void)test_Property_delegate_Type_Is_BaseTableViewDataSourceDelegate {
    NSString *propertyType = [NSObject typeForProperty:@"delegate" objectClass:self.objectClass];
    XCTAssertTrue([propertyType containsString:@"<BaseTableViewDataSourceDelegate>"],
                  @"BaseTableViewDataSource的成员变量delegate遵循BaseTableViewDataSourceDelegate");
}

#pragma mark - 3.2.*
- (void)test_Exist_Method_numberOfSectionsInTableView {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(numberOfSectionsInTableView:)],
                  @"BaseTableViewDataSource需要实现方法numberOfSectionsInTableView:");
}

- (void)test_Method_numberOfSectionsInTableView_Returns_Equal_itemSections_count_0 {
    NSInteger sectionCount = [self.dataSource numberOfSectionsInTableView:self.tableView];
    XCTAssertEqual(sectionCount, 0, @"方法numberOfSectionsInTableView:的返回值与itemSections的count数相等");
}

- (void)test_Method_numberOfSectionsInTableView_Returns_Equal_itemSections_count_1 {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSInteger sectionCount = [self.dataSource numberOfSectionsInTableView:self.tableView];
    XCTAssertEqual(sectionCount, 1, @"方法numberOfSectionsInTableView:的返回值与itemSections的count数相等");
}

#pragma mark - 3.3.*
- (void)test_Exist_Method_tableView_numberOfRowsInSection {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(tableView:numberOfRowsInSection:)],
                  @"BaseTableViewDataSource需要实现方法tableView:numberOfRowsInSection:");
}

- (void)test_Method_tableView_numberOfRowsInSection_Returns_Equal_itemSections_count_0 {
    NSInteger rowCount = [self.dataSource tableView:self.tableView numberOfRowsInSection:0];
    XCTAssertEqual(rowCount, 0, @"方法tableView:numberOfRowsInSection:的返回值与itemSections中对应BaseTableViewItemSection中的items的count数相等");
}

- (void)test_Method_tableView_numberOfRowsInSection_Returns_Equal_itemSections_count_1 {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSInteger rowCount = [self.dataSource tableView:self.tableView numberOfRowsInSection:0];
    XCTAssertEqual(rowCount, 0, @"方法tableView:numberOfRowsInSection:的返回值与itemSections中对应BaseTableViewItemSection中的items的count数相等");
}

#pragma mark - 3.4.*
- (void)test_Exist_Method_tableView_titleForHeaderInSection {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(tableView:titleForHeaderInSection:)],
                  @"BaseTableViewDataSource需要实现方法tableView:titleForHeaderInSection:");
}

- (void)test_Method_tableView_titleForHeaderInSection_Returns_nil_When_itemSections_Is_Empty {
    NSString *headerTitle = [self.dataSource tableView:self.tableView titleForHeaderInSection:0];
    XCTAssertNil(headerTitle, @"方法tableView:titleForHeaderInSection:的在itemSections为空时返回nil");
}

- (void)test_Method_tableView_titleForHeaderInSection_Returns_Equal_itemSections_sectionHeaderTitle_nil {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSString *headerTitle = [self.dataSource tableView:self.tableView titleForHeaderInSection:0];
    XCTAssertNil(headerTitle, @"方法tableView:titleForHeaderInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionHeaderTitle一致");
}

- (void)test_Method_tableView_titleForHeaderInSection_Returns_Equal_itemSections_sectionHeaderTitle_Not_Nil {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    section.sectionHeaderTitle = @"headerTitle";
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSString *headerTitle = [self.dataSource tableView:self.tableView titleForHeaderInSection:0];
    XCTAssertTrue([headerTitle isEqualToString:@"headerTitle"],
                  @"方法tableView:titleForHeaderInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionHeaderTitle一致");
}
- (void)test_Exist_Method_tableView_titleForFooterInSection {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(tableView:titleForFooterInSection:)],
                  @"BaseTableViewDataSource需要实现方法tableView:titleForFooterInSection:");
}

- (void)test_Method_tableView_titleForFooterInSection_Returns_nil_When_itemSections_Is_Empty {
    NSString *headerTitle = [self.dataSource tableView:self.tableView titleForFooterInSection:0];
    XCTAssertNil(headerTitle, @"方法tableView:titleForFooterInSection:的在itemSections为空时返回nil");
}

- (void)test_Method_tableView_titleForFooterInSection_Returns_Equal_itemSections_sectionHeaderTitle_nil {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSString *headerTitle = [self.dataSource tableView:self.tableView titleForFooterInSection:0];
    XCTAssertNil(headerTitle, @"方法tableView:titleForFooterInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionFooterTitle一致");
}

- (void)test_Method_tableView_titleForFooterInSection_Returns_Equal_itemSections_sectionHeaderTitle_Not_Nil {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    section.sectionFooterTitle = @"footerTitle";
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSString *footerTitle = [self.dataSource tableView:self.tableView titleForFooterInSection:0];
    XCTAssertTrue([footerTitle isEqualToString:@"footerTitle"],
                  @"方法tableView:titleForFooterInSection:的返回值与itemSections中对应的BaseTableViewItemSection的sectionFooterTitle一致");
}

#pragma mark - 3.5.*
- (void)test_Exist_Method_tableView_cellForRowAtIndexPath {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(tableView:cellForRowAtIndexPath:)],
                  @"BaseTableViewDataSource需要实现方法tableView:cellForRowAtIndexPath:");
}

- (void)test_Method_tableView_cellForRowAtIndexPath_Returns_Not_Nil {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertNotNil(cell, @"方法tableView:cellForRowAtIndexPath:返回值不为空");
}

- (void)test_Method_tableView_cellForRowAtIndexPath_Returns_Type_Is_BaseTableViewCell {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertTrue([cell isKindOfClass:[BaseTableViewCell class]],
                  @"方法tableView:cellForRowAtIndexPath:返回的cell类型是BaseTableViewCell类型或BaseTableViewCell的子类");
}

- (void)test_Method_tableView_cellForRowAtIndexPath_Returns_BaseTableViewCell_When_cellClassForIndexPath_Returns_Not_Type_BaseTableViewCell {
    BaseTableViewDataSourceDelegateConformer *conformer = [BaseTableViewDataSourceDelegateConformer new];
    self.dataSource.delegate = conformer;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertTrue([cell isKindOfClass:[BaseTableViewCell class]],
                  @"cellClassForIndexPath:返回为NULL时，方法tableView:cellForRowAtIndexPath:返回的cell类型是BaseTableViewCell");
    
    conformer.cellClass = [UITableViewCell class];
    
    cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    XCTAssertTrue([cell isKindOfClass:[BaseTableViewCell class]],
                  @"cellClassForIndexPath:返回为UITableViewCell时，方法tableView:cellForRowAtIndexPath:返回的cell类型是BaseTableViewCell");
}

- (void)test_Method_tableView_cellForRowAtIndexPath_Returns_BaseTableViewCell_When_cellClassForIndexPath_Returns_Is_Type_BaseTableViewCell {
    BaseTableViewDataSourceDelegateConformer *conformer = [BaseTableViewDataSourceDelegateConformer new];
    conformer.cellClass = [BaseTableViewCell class];
    
    self.dataSource.delegate = conformer;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertTrue([cell isKindOfClass:[BaseTableViewCell class]],
                  @"cellClassForIndexPath:返回为BaseTableViewCell时，方法tableView:cellForRowAtIndexPath:返回的cell类型是BaseTableViewCell");
    
}

- (void)test_Method_tableView_cellForRowAtIndexPath_Returns_TestTableViewCell_When_cellClassForIndexPath_Returns_Is_Type_TestTableViewCell {
    BaseTableViewDataSourceDelegateConformer *conformer = [BaseTableViewDataSourceDelegateConformer new];
    conformer.cellClass = [TestTableViewCell class];
    
    self.dataSource.delegate = conformer;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertTrue([cell isKindOfClass:[TestTableViewCell class]],
                  @"cellClassForIndexPath:返回为TestTableViewCell时，方法tableView:cellForRowAtIndexPath:返回的cell类型是TestTableViewCell");
}

#pragma mark - 3.6.*
- (void)test_Reused_Cell_Is_Nil_Before_tableView_cellForRowAtIndexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
    XCTAssertNil(cell, @"在调用方法tableView:cellForRowAtIndexPath:之前，无法获取到可重用cell");
}

- (void)test_Reused_Cell_Not_Nil_Before_tableView_cellForRowAtIndexPath {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
    XCTAssertNotNil(cell, @"在调用方法tableView:cellForRowAtIndexPath:之后，可以获取到与其返回cell类名为可重用标识符的可重用cell");
}

#pragma mark - 3.7.*
- (void)test_Exist_Method_cellObjectForIndexPath {
    XCTAssertTrue([BaseTableViewDataSource instancesRespondToSelector:@selector(cellObjectForIndexPath:)],
                  @"BaseTableViewDataSource实现方法cellObjectForIndexPath:");
}

- (void)test_Method_cellObjectForIndexPath_Returns_Nil_When_indexPath_OutOfRange {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    BaseTableViewItem *item = [self.dataSource cellObjectForIndexPath:indexPath];
    XCTAssertNil(item, @"indexPath超出范围时，cellObjectForIndexPath:返回nil");
    
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    [section.items addObjectsFromArray:@[[BaseTableViewItem new], [BaseTableViewItem new]]];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    item = [self.dataSource cellObjectForIndexPath:indexPath];
    XCTAssertNil(item, @"indexPath超出范围时，cellObjectForIndexPath:返回nil");
    
    indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    item = [self.dataSource cellObjectForIndexPath:indexPath];
    XCTAssertNil(item, @"indexPath超出范围时，cellObjectForIndexPath:返回nil");
}

- (void)test_Method_cellObjectForIndexPath_Returns_Equal_Item_In_itemSections {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    [section.items addObjectsFromArray:@[[BaseTableViewItem new], [BaseTableViewItem new]]];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    BaseTableViewItem *item = [self.dataSource cellObjectForIndexPath:indexPath];
    
    XCTAssertEqual(item, self.dataSource.itemSections[0].items[0],
                   @"方法cellObjectForIndexPath:返回值与itemSections中对应的BaseTableViewItem一致");
}

#pragma mark - 3.8.*
- (void)test_cellObjectForIndexPath_Returns_Equal_tableView_cellForRowAtIndexPath_Cell_cellObject {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    [section.items addObjectsFromArray:@[[BaseTableViewItem new], [BaseTableViewItem new]]];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    BaseTableViewItem *item = [self.dataSource cellObjectForIndexPath:indexPath];
    
    BaseTableViewCell *cell = (BaseTableViewCell *)[self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    BaseTableViewItem *cellObject = cell.cellObject;
    
    XCTAssertEqual(item, cellObject,
                   @"方法tableView:cellForRowAtIndexPath:返回的cell的cellObject与方法cellObjectForIndexPath:返回的BaseTableViewItem一致");
}

@end
