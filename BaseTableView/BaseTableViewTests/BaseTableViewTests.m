//
//  BaseTableViewTests.m
//  BaseTableViewTests
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface BaseTableViewTests : XCTestCase

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
 
 4.3.1 设置成员变量baseDelegate后，BaseTableView的delegate属性与baseDelegate一致
 4.3.2 单独设置BaseTableView的delegate属性无效
 
 4.4.1 BaseTableView实现了方法tableView:heightForRowAtIndexPath:
 4.4.2 BaseTableView的rowHeight属性不为0时，方法tableView:heightForRowAtIndexPath:返回rowHeight属性的值
 4.4.3 BaseTableView的rowHeight属性为0时，方法tableView:heightForRowAtIndexPath:返回值与对应的BaseTableViewItem的cellHeight值一致
 4.4.4 BaseTableView的rowHeight属性为0时，方法tableView:heightForRowAtIndexPath:返回值不为BaseCellInvalidHeight
 
 4.5.1 BaseTableView实现了方法tableView:didSelectRowAtIndexPath:
 4.5.2 点击cell后，如果baseDelegate实现了方法tableView:didSelectCellObject:atIndexPath:,则调用baseDelegate的该方法
 4.5.3 方法tableView:didSelectCellObject:atIndexPath:传递的cellObject与dataSource的cellObjectForIndexPath:方法的返回值一致
 4.5.4 点击cell后，如果baseDelegate没有实现方法tableView:didSelectCellObject:atIndexPath:，但是实现了方法tableView:didSelectRowAtIndexPath:，则调用该方法
 
 5.1.1 BaseTableViewCell是UITableViewCell的子类
 5.1.2 BaseTableViewCell拥有成员变量cellObject
 5.1.3 成员变量cellObject的类型为BaseTableViewItem
 
 5.2.1 BaseTableViewCell实现了类方法rowHeightForCellObject:
 5.2.2 BaseTableViewCell的类方法rowHeightForCellObject:返回默认值44.0f
 */
@implementation BaseTableViewTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}

@end
