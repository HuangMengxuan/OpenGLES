//
//  HMXViewControllerTests.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+Property.h"
#import "HMXViewController.h"
#import "HMXTableViewDataSource.h"
#import "HMXFakeTableView.h"

@interface HMXViewControllerTests : XCTestCase

@end

@implementation HMXViewControllerTests

/*
 1.1 存在成员变量tableView
 1.2 成员变量tableView的类型是UITableView
 
 2.1 存在成员变量dataSource
 2.2 成员变量dataSource的遵循UITableViewDataSource、UITableViewDelegate
 
 3.1 实例化HMXViewController之后，可以获取到成员变量tableView
 3.2 设置dataSource之后，tableView被设置数据源
 3.3 设置dataSource之后，tableView被设置代理
 
 4.1 遵循HMXTableViewDataSourceDelegate
 4.2 实现tableViewDataSourceChanged:方法
 4.3 实现tableViewDataSource:didSelectIndexPath:方法
 4.4 设置dataSource之后，dataSource的delegate的值为ViewController
 4.5 dataSource的dataArray属性改变后，刷新了TableView，即调用了TableView的reloadData方法
 4.6 点击了TableView的Cell之后，push一个新的ViewController
 4.7 点击了TableView的Cell之后，push出的ViewController与点击的cell所对应的数据源的type一直
 */

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Property_Exist_TableView {
    NSString *propertyName = [NSObject nameForProperty:@"tableView" objectClass:[HMXViewController class]];
    XCTAssertTrue([propertyName isEqualToString:@"tableView"], @"ViewController exist property tableView");
}

- (void)test_Property_TableView_Type_ShouldBeUITableView {
    NSString *propertyType = [NSObject typeForProperty:@"tableView" objectClass:[HMXViewController class]];
    XCTAssertTrue([propertyType isEqualToString:@"UITableView"], @"Property tableView is UITableView type");
}

- (void)test_Property_Exist_DataSource {
    NSString *propertyName = [NSObject nameForProperty:@"dataSource" objectClass:[HMXViewController class]];
    XCTAssertTrue([propertyName isEqualToString:@"dataSource"], @"ViewController exist property dataSource");
}

- (void)test_Property_DataSource_ShouldBeUITableViewDelegateAndUITableViewDataSource {
    NSString *propertyType = [NSObject typeForProperty:@"dataSource" objectClass:[HMXViewController class]];
    
    XCTAssertTrue([propertyType containsString:@"<UITableViewDataSource>"],
                  @"Property dataSource conform UITableViewDataSource protocol");
    
    XCTAssertTrue([propertyType containsString:@"<UITableViewDelegate>"],
                  @"Property dataSource conform UITableViewDelegate protocol");
}

- (void)test_ViewController_Exist_Instance_TableView {
    HMXViewController *viewController = [[HMXViewController alloc] init];
    XCTAssertNotNil(viewController.tableView, @"ViewController exist instance tableView");
}

- (void)test_TableView_DataSource_Equal_To_DataSource {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    HMXViewController *viewController = [[HMXViewController alloc] init];
    viewController.dataSource = dataSource;
    
    XCTAssertTrue(viewController.tableView.dataSource == dataSource,
                  @"tableView's dataSource equal to dataSource");
}

- (void)test_TableView_Delegate_Equal_To_DataSource {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    HMXViewController *viewController = [[HMXViewController alloc] init];
    viewController.dataSource = dataSource;
    
    XCTAssertTrue(viewController.tableView.delegate == dataSource,
                  @"tableView's delegate equal to dataSource");
}

- (void)test_ViewController_Conform_HMXTableViewDataSourceDelegate {
    HMXViewController *viewController = [[HMXViewController alloc] init];
    XCTAssertTrue([viewController conformsToProtocol:@protocol(HMXTableViewDataSourceDelegate)],
                  @"ViewController conform HMXTableViewDataSourceDelegate");
}

- (void)test_ViewController_Response_tableViewDataSourceChanged {
    HMXViewController *viewController = [[HMXViewController alloc] init];
    XCTAssertTrue([viewController respondsToSelector:@selector(tableViewDataSourceChanged:)],
                  @"ViewController response tableViewDataSourceChanged: method");
}

- (void)test_ViewController_Response_tableViewDataSource_didSelectIndexPath {
    HMXViewController *viewController = [[HMXViewController alloc] init];
    
    XCTAssertTrue([viewController respondsToSelector:@selector(tableViewDataSource:didSelectIndexPath:)],
                  @"ViewController response tableViewDataSource:didSelectIndexPath: method");
}

- (void)test_DataSource_Delegate_Not_Nil_After_Set_DataSource {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    HMXViewController *viewController = [[HMXViewController alloc] init];
    
    viewController.dataSource = dataSource;
    
    XCTAssertNotNil(dataSource.delegate, @"dataSource's delegate not nil");
}

- (void)test_Should_Call_reloadData_When_Called_tableViewDataSourceChanged {
    HMXTableViewDataSource *dataSource = [[HMXTableViewDataSource alloc] init];
    HMXFakeTableView *faceTableView = [[HMXFakeTableView alloc] init];
    faceTableView.dataSource = dataSource;
    faceTableView.delegate = dataSource;
    
    HMXViewController *viewController = [[HMXViewController alloc] init];
    viewController.dataSource = dataSource;
    viewController.tableView = faceTableView;
    
    dataSource.dataArray = @[@"A", @"B", @"C"];
    
    XCTAssertTrue(faceTableView.didCallReloadData, @"did call reloadData when call tableViewDataSourceChanged ");
}

- (void)test_ViewController_Response_pushViewControllerWithType {
    HMXViewController *viewController = [[HMXViewController alloc] init];
    
    XCTAssertTrue([viewController respondsToSelector:@selector(pushViewControllerWithType:)],
                  @"ViewController response pushViewControllerWithType: method");
}

- (void)test_pushViewControllerWithType_For_Type1 {
    
}

- (void)test_pushViewControllerWithType_For_Type2 {
    
}

- (void)test_Should_Push_Right_ViewController_When_Call_tableViewDataSource_didSelectIndexPath {
    
}


@end
