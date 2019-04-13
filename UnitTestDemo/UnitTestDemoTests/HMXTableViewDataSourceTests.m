//
//  HMXTableViewDataSourceTests.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+Property.h"
#import "HMXTableViewDataSource.h"
#import "HMXTableViewCell.h"
#import "HMXFakeTableViewDataSourceDelegateConfromal.h"

@interface HMXTableViewDataSourceTests : XCTestCase

@property (nonatomic, strong) HMXTableViewDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HMXTableViewDataSourceTests

/*
 1.1 遵循UITableViewDataSource协议
 1.2 实现tableView:numberOfRowsInSection:方法
 1.3 实现tableView:cellForRowAtIndexPath:方法
 
 2.1 遵循UITableViewDelegate协议
 2.2 实现tableView:didSelectRowAtIndexPath:方法
 
 3.1 存在成员变量dataArray
 3.2 成员变量dataArray的类型为NSArray
 3.3 为UItableView提供的数据个数与成员变量dataArray的数据个数相等
 3.4 为UItableView提供的数据与为每个Cell设置的数据一致
 
 4.1 注册了重用cell则能获取到cell对象
 4.2 未注册重用的cell则不能获取到cell对象
 
 5.1 存在成员变量delegate
 5.2 成员变量delegate的类型为id<HMXTableViewDataSourceDelegate>
 5.3 数据源改变时，调用了delegate的tableViewDataSourceChanged:
 5.4 点击cell的时候，调用了delegate的tableViewDataSource:didSelectIndexPath:
 5.5 点击cell的时候，调用了delegate的tableViewDataSource:didSelectIndexPath:,参数didSelectIndexPath与点击的IndexPath一致
 */


- (void)setUp {
    [super setUp];
    
    self.dataSource = [[HMXTableViewDataSource alloc] init];
    self.tableView = [[UITableView alloc] init];
    [self.tableView registerClass:[HMXTableViewCell class] forCellReuseIdentifier:[HMXTableViewCell cellIdentifier]];
}

- (void)tearDown {
    self.dataSource = nil;
    self.tableView = nil;
    
    [super tearDown];
}

- (void)test_Conform_UITableViewDataSource_Protocol {
    XCTAssertTrue([self.dataSource conformsToProtocol:@protocol(UITableViewDataSource)],
                  @"HMXTableViewDataSource conform UITableViewDataSource protocol");
}

- (void)test_ImplMethod_tableView_numberOfRowsInSection {
    XCTAssertTrue([self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)],
                  @"HMXTableViewDataSource implement tableView:numberOfRowsInSection: method");
}

- (void)test_ImplMethod_tableView_cellForRowAtIndexPath {
    XCTAssertTrue([self.dataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)],
                  @"HMXTableViewDataSource implement tableView:cellForRowAtIndexPath: method");
}

- (void)test_Conform_UITableViewDelegate_Protocol {
    XCTAssertTrue([self.dataSource conformsToProtocol:@protocol(UITableViewDelegate)],
                  @"HMXTableViewDataSource conform UITableViewDelegate protocol");
}

- (void)test_ImplMethod_tableView_didSelectRowAtIndexPath {
    XCTAssertTrue([self.dataSource respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)],
                  @"HMXTableViewDataSource implement tableView:didSelectRowAtIndexPath: method");
}

- (void)test_Property_Exist_DataArray {
    NSString *propertyName = [NSObject nameForProperty:@"dataArray" objectClass:[HMXTableViewDataSource class]];
    XCTAssertTrue([propertyName isEqualToString:@"dataArray"], @"TableViewDataSource exist property dataArray");
}

- (void)test_Property_TableView_Type_ShouldBeNSArray {
    NSString *propertyType = [NSObject typeForProperty:@"dataArray" objectClass:[HMXTableViewDataSource class]];
    XCTAssertTrue([propertyType isEqualToString:@"NSArray"], @"Property dataArray is NSArray type");
}

- (void)test_NilOrEmpty_DataArray_Generate_Zero_Row_Count {
    NSArray *array = nil;
    self.dataSource.dataArray = array;
    NSInteger rowCount = [self.dataSource tableView:self.tableView numberOfRowsInSection:0];
    XCTAssertEqual(rowCount, 0, @"rowCount equal to zero when dataArray is nil");
    
    self.dataSource.dataArray = @[];
    rowCount = [self.dataSource tableView:self.tableView numberOfRowsInSection:0];
    XCTAssertEqual(rowCount, 0, @"rowCount equal to zero when dataArray is empty");
}

- (void)test_DataArray_Count_Equal_Row_Count {
    // 模拟或生成真实对象进行测试？
    self.dataSource.dataArray = @[@"cell1", @"cell2", @"cell3"];
    NSInteger rowCount = [self.dataSource tableView:self.tableView numberOfRowsInSection:0];
    XCTAssertEqual(rowCount, self.dataSource.dataArray.count, @"rowCount equal to dataArray's count'");
}

- (void)test_First_Cell_Has_First_DataModel {
    self.dataSource.dataArray = @[@"cell1", @"cell2", @"cell3"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    HMXTableViewCell *cell = (HMXTableViewCell *)[self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    XCTAssertEqualObjects(cell.model, self.dataSource.dataArray[0], @"first cell has first data model");
}

- (void)test_Second_Cell_Has_Second_DataModel {
    self.dataSource.dataArray = @[@"cell1", @"cell2", @"cell3"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    HMXTableViewCell *cell = (HMXTableViewCell *)[self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
    XCTAssertEqualObjects(cell.model, self.dataSource.dataArray[1], @"second cell has second data model");
}

- (void)test_DataArray_Item_Equal_Cell_Model {
    // 模拟或生成真实对象进行测试？
    self.dataSource.dataArray = @[@"cell1", @"cell2", @"cell3"];
    
    BOOL equal = YES;
    for (NSInteger i = 0; i < self.dataSource.dataArray.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        HMXTableViewCell *cell = (HMXTableViewCell *)[self.dataSource tableView:self.tableView cellForRowAtIndexPath:indexPath];
        if (![cell.model isEqual:self.dataSource.dataArray[i]]) {
            equal = NO;
            break;
        }
    }
    XCTAssertTrue(equal, @"dataArray item equal cell data model");
}

- (void)test_Provide_Cell_If_Registed_Reusable_Identifier {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    UITableView *tableView = [[UITableView alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [tableView registerClass:[HMXTableViewCell class] forCellReuseIdentifier:[HMXTableViewCell cellIdentifier]];
    UITableViewCell *cell = [dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    
    XCTAssertNotNil(cell, @"provide cell if registed reuasble identifier");
    XCTAssertTrue([cell isKindOfClass:[HMXTableViewCell class]], @"provide cell type is HMXTableViewCell");
}

- (void)test_Provide_Nil_If_Did_Not_Registed_Reusable_Identifier {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    UITableView *tableView = [[UITableView alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    XCTAssertNil(cell, @"provide nil if did not registed reuasble identifier");
}

- (void)test_Property_Exist_Delegate {
    NSString *propertyName = [NSObject nameForProperty:@"delegate" objectClass:[HMXTableViewDataSource class]];
    XCTAssertTrue([propertyName isEqualToString:@"delegate"], @"TableViewDataSource exist property delegate");
}

- (void)test_Property_Delegate_Conform_HMXTableViewDataSourceDelegate_Protocol {
    NSString *propertyType = [NSObject typeForProperty:@"delegate" objectClass:[HMXTableViewDataSource class]];
    XCTAssertTrue([propertyType containsString:@"<HMXTableViewDataSourceDelegate>"],
                  @"Property delegate conform HMXTableViewDataSourceDelegate protocol");
}

- (void)test_DataArray_Value_Changed_Should_Call_tableViewDataSourceChanged {
    HMXFakeTableViewDataSourceDelegateConfromal *conformal = [HMXFakeTableViewDataSourceDelegateConfromal new];
    self.dataSource.delegate = conformal;
    
    self.dataSource.dataArray = @[];
    XCTAssertTrue(conformal.calledTableViewDataSourceChanged,
                  @"called tableViewDataSourceChanged: method when dataArray value changed");
}

- (void)test_Click_Cell_Should_Call_tableViewDataSource_didSelectIndexPath {
    HMXFakeTableViewDataSourceDelegateConfromal *conformal = [HMXFakeTableViewDataSourceDelegateConfromal new];
    self.dataSource.delegate = conformal;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.dataSource tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    XCTAssertTrue(conformal.calledTableViewDataSourceDidSelectIndexPath,
                  @"called tableViewDataSource:didSelectIndexPath: method when click cell");
}

- (void)test_Click_Cell_Should_Passed_Cell_EqualTo_Selected_IndexPath {
    HMXFakeTableViewDataSourceDelegateConfromal *conformal = [HMXFakeTableViewDataSourceDelegateConfromal new];
    
    self.dataSource.delegate = conformal;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.dataSource tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    XCTAssertEqualObjects(conformal.selectedIndexPath, indexPath, @"passed cell equal to selected indexPath");
}

@end
