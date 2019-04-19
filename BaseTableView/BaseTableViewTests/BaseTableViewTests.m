//
//  BaseTableViewTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTableView.h"
#import "BaseTableViewDelegateConformer.h"

@interface BaseTableViewTests : XCTestCase

@property (nonatomic, strong) BaseTableViewDataSource *dataSource;
@property (nonatomic, strong) BaseTableView *tableView;

@end

/**
 4.1.1 BaseTableView继承自UITableView
 4.1.2 BaseTableView拥有成员变量baseDataSource
 4.1.3 成员变量baseDataSource的类型为BaseTableViewDataSource
 4.1.4 BaseTableView拥有成员变量baseDelegate
 4.1.5 成员变量baseDelegate的类型为id<BaseTableViewDelegate>
 4.1.6 成员变量baseDelegate被weak修饰
 
 4.2.1 设置成员变量baseDataSource后，BaseTableView的dataSource属性与baseDataSource一致
 4.2.2 单独设置BaseTableView的dataSource属性无效
 
 4.3.1 成员变量delegate的值为self
 4.3.2 单独设置BaseTableView的delegate属性无效
 
 4.4.1 BaseTableView实现了方法tableView:heightForRowAtIndexPath:
 4.4.2 BaseTableView的rowHeight>0时，方法tableView:heightForRowAtIndexPath:返回rowHeight属性的值
 4.4.3 BaseTableView的rowHeight<=0时，方法tableView:heightForRowAtIndexPath:返回值与对应的BaseTableViewItem的cellHeight值一致
 4.4.4 BaseTableView的rowHeight<=0时，方法tableView:heightForRowAtIndexPath:返回值不为BaseCellInvalidHeight
 ? 用例没有覆盖完全，需要添加缺少的用例
 
 4.5.1 BaseTableView实现了方法tableView:didSelectRowAtIndexPath:
 4.5.2 点击cell后，如果baseDelegate实现了方法tableView:didSelectCellObject:atIndexPath:,则调用baseDelegate的该方法
 4.5.3 方法tableView:didSelectCellObject:atIndexPath:传递的cellObject与dataSource的cellObjectForIndexPath:方法的返回值一致
 4.5.4 点击cell后，如果baseDelegate没有实现方法tableView:didSelectCellObject:atIndexPath:，但是实现了方法tableView:didSelectRowAtIndexPath:，则调用该方法
 
 */
@implementation BaseTableViewTests

- (void)setUp {
    [super setUp];
    
    self.dataSource = [BaseTableViewDataSource new];
    self.tableView = [BaseTableView new];
}

- (void)tearDown {
    self.dataSource = nil;
    self.tableView = nil;
    
    [super tearDown];
}


#pragma mark - 4.2.*
- (void)test_Property_dataSource_Equal_baseDataSource {
    self.tableView.baseDataSource = self.dataSource;
    
    XCTAssertEqualObjects(self.tableView.dataSource, self.tableView.baseDataSource,
                   @"设置成员变量baseDataSource后，BaseTableView的dataSource属性与baseDataSource一致");
}

- (void)test_Method_setDataSource_Invalid {
    self.tableView.dataSource = self.dataSource;

    XCTAssertNotEqualObjects(self.tableView.dataSource, self.dataSource,
                             @"单独设置BaseTableView的dataSource属性无效");
    
    self.tableView.baseDataSource = self.dataSource;
    self.tableView.dataSource = nil;
    
    XCTAssertEqualObjects(self.tableView.dataSource, self.tableView.baseDataSource,
                          @"单独设置BaseTableView的dataSource属性无效");
}

#pragma mark - 4.3.*
- (void)test_Property_delegate_Equal_self {
    XCTAssertEqualObjects(self.tableView.delegate, self.tableView, @"成员变量delegate的值为self");
}

- (void)test_Method_baseDelegate_Invalid {
    BaseTableViewDelegateConformer *conformer = [BaseTableViewDelegateConformer new];
    
    self.tableView.delegate = conformer;
    
    XCTAssertNotEqualObjects(self.tableView.delegate, conformer, @"单独设置BaseTableView的delegate属性无效");
}

#pragma mark - 4.4.*
- (void)test_Exist_Method_tableView_heightForRowAtIndexPath {
    XCTAssertTrue([BaseTableView instancesRespondToSelector:@selector(tableView:heightForRowAtIndexPath:)],
                  @"BaseTableView需要实现方法tableView:heightForRowAtIndexPath:");
}

- (void)test_Method_tableView_heightForRowAtIndexPath_Returns_rowHeight_When_rowHeight_Not_Greater_Than_0 {
    self.tableView.rowHeight = 30.0f;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    CGFloat rowHeight = [self.tableView tableView:self.tableView heightForRowAtIndexPath:indexPath];
    
    XCTAssertTrue(rowHeight == 30.0f,
                  @"BaseTableView的rowHeight>0时，方法tableView:heightForRowAtIndexPath:返回rowHeight属性的值");
}

- (void)test_Method_tableView_heightForRowAtIndexPath_Returns_Equal_BaseTableViewItem_cellHeight {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    
    [section.items addObjectsFromArray:@[[[BaseTableViewItem alloc] initWithTitle:@"title"]]];
    self.dataSource.itemSections = @[section].mutableCopy;
    self.tableView.baseDataSource = self.dataSource;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    CGFloat rowHeight = [self.tableView tableView:self.tableView heightForRowAtIndexPath:indexPath];
    
    XCTAssertEqual(rowHeight, section.items[0].cellHeight,
                   @"BaseTableView的rowHeight属性为<=0时，方法tableView:heightForRowAtIndexPath:返回值与对应的BaseTableViewItem的cellHeight值一致");
    
}

- (void)test_Method_tableView_heightForRowAtIndexPath_Returns_Not_Equal_BaseCellInvalidHeight {
    self.tableView.baseDataSource = self.dataSource;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    CGFloat rowHeight = [self.tableView tableView:self.tableView heightForRowAtIndexPath:indexPath];
    
    XCTAssertTrue(rowHeight != BaseCellInvalidHeight,
                  @"BaseTableView的rowHeight<=0时，方法tableView:heightForRowAtIndexPath:返回值不为BaseCellInvalidHeight");
}

#pragma mark - 4.5.*
- (void)test_Exist_Method_tableView_didSelectRowAtIndexPath {
    XCTAssertTrue([BaseTableView instancesRespondToSelector:@selector(tableView:didSelectRowAtIndexPath:)],
                  @"BaseTableView需要实现方法tableView:didSelectRowAtIndexPath:");
}

- (void)test_Should_Call_tableView_didSelectCellObject_atIndexPath_If_baseDelegate_Response {
    BaseTableViewDelegateConformer *conformer = [BaseTableViewDelegateConformer new];
    self.tableView.baseDelegate = conformer;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    XCTAssertTrue(conformer.calledDidSelectCellObject,
                  @"点击cell后，如果baseDelegate实现了方法tableView:didSelectCellObject:atIndexPath:,则调用baseDelegate的该方法");
}

- (void)test_Should_Call_tableView_didSelectRowAtIndexPath_If_baseDelegate_Not_Response_tableView_didSelectCellObject_atIndexPath {
    BaseTableViewDelegateConformer *conformer = [BaseTableViewDelegateConformer new];
    self.tableView.baseDelegate = conformer;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    XCTAssertTrue(conformer.calledDidSelectRowAtIndexPath,
                  @"点击cell后，如果baseDelegate没有实现方法tableView:didSelectCellObject:atIndexPath:，但是实现了方法tableView:didSelectRowAtIndexPath:，则调用该方法");
}

- (void)test_Method_tableView_didSelectCellObject_atIndexPath_cellObject_Equal_dataSource_cellObjectForIndexPath_Returns {
    BaseTableViewItemSection *section = [BaseTableViewItemSection new];
    [section.items addObjectsFromArray:@[[BaseTableViewItem new], [BaseTableViewItem new]]];
    self.dataSource.itemSections = @[section].mutableCopy;
    
    BaseTableViewDelegateConformer *conformer = [BaseTableViewDelegateConformer new];
    self.tableView.baseDelegate = conformer;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    BaseTableViewItem *item = [self.dataSource cellObjectForIndexPath:indexPath];
    
    XCTAssertNotEqualObjects(conformer.cellObject, item,
                             @"方法tableView:didSelectCellObject:atIndexPath:传递的cellObject与dataSource的cellObjectForIndexPath:方法的返回值一致");
}

@end
