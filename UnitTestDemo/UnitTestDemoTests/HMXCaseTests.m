//
//  HMXCaseTests.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/3.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HMXCaseTests : XCTestCase

@property (nonatomic, strong) UIView *testView;

@end

@implementation HMXCaseTests

- (void)setUp {
    self.testView = [UIView new];
}

- (void)tearDown {
    self.testView = nil;
}

- (void)testBoolean {
    int a = 1;
    int b = 2;
    
    XCTAssert(a != b, @"Generates a failure when expression == false");
    XCTAssertTrue(a != b, @"Generates a failure when expression == false");
    XCTAssertFalse(a == b, @"Generates a failure when expression == true");
}

- (void)testNil {
    NSString *str1 = nil;
    NSString *str2 = @"";
    
    XCTAssertNil(str1, @"Generates a failure when expression != nil");
    XCTAssertNotNil(str2, @"Generates a failure when expression == nil");
}

- (void)testEquality {
    NSString *str1 = @"123";
    NSString *str2 = [NSString stringWithFormat:@"123"];
    NSString *str3 = @"123";
    
    NSArray<NSString *> *arr1 = @[str1, str2];
    NSArray<NSString *> *arr2 = [NSArray arrayWithArray:arr1];
    NSArray<NSString *> *arr3 = arr1.copy;
    
    float num1 = 1.0f;
    float num2 = 2.0f;
    float num3 = 1.0001f;
    
    // == 比较的是指针地址
    // isEqualTo 比较的是内容
    XCTAssertEqual(num1, num3, @"Asserts that two expressions have the same value.");
    XCTAssertEqual(str1, str2, @"Asserts that two expressions have the same value.");
    XCTAssertEqual(str1, str3, @"Asserts that two expressions have the same value.");
    XCTAssertEqual(arr1, arr2, @"Asserts that two expressions have the same value.");
    XCTAssertEqual(arr1, arr3, @"Asserts that two expressions have the same value.");
    
    XCTAssertEqualObjects(str1, str2, @"Asserts that two objects are considered equal.");
    XCTAssertEqualObjects(arr1, arr2, @"Asserts that two objects are considered equal.");
    
    XCTAssertEqualWithAccuracy(num1, num3, 0.001, @"Asserts that two expressions have the same value within a certain accuracy.");
    XCTAssertNotEqualWithAccuracy(num1, num2, 0.001, @"Asserts that two expressions do not have the same value within a certain accuracy.");
}

- (void)testCompareable {
    float num1 = 1.0f;
    float num2 = 2.0f;
    float num3 = 2.0f;
    
    XCTAssertGreaterThan(num3, num1, @"Asserts that the value of one expression is greater than another.");
    XCTAssertGreaterThanOrEqual(num3, num2, @"Asserts that the value of one expression is greater than or equal to another.");
    
    XCTAssertLessThan(num1, num2, @"Asserts that the value of one expression is less than another.");
    XCTAssertLessThanOrEqual(num2, num3, @"Asserts that the value of one expression is less than or equal to another.");
}

- (void)testException {
    
//    XCTAssertThrows(exception, @"Asserts that an expression throws an NSException.");
}

- (void)testFailing {
    XCTFail(@"Generates a failure immediately and unconditionally.");
}


- (void)testAsynchronous {
    /*
        1. 创建新的XCTestExpectation实例对象
        2. 在异步操作完成的回调中调用XCTestExpectation实例对象的fulfill方法
        3. 在主线程中调用waitForExpectations:timeout:方法，设置超时时间，等待所有XCTestExpectation实例对象的fulfill方法被执行
     
        waitForExpectations:timeout:方法会阻塞主线程，等待所有XCTestExpectation实例对象的fulfill方法被执行，或者到达超时时间。
        如果到达超时时间后，有XCTestExpectation实例对象的fulfill方法没有被执行，测试就是失败
     */
    XCTestExpectation *expectation1 = [[XCTestExpectation alloc] initWithDescription:@"Test expectation 1"];
    XCTestExpectation *expectation2 = [[XCTestExpectation alloc] initWithDescription:@"Test expectation 2"];
    
    
    expectation2.assertForOverFulfill = YES;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.0f];
        
        [expectation1 fulfill];
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0f];
        
        [expectation2 fulfill];
    });
    
    [self waitForExpectations:@[expectation1, expectation2] timeout:5.0f];
    
    [self waitForExpectationsWithTimeout:3.0f handler:^(NSError * _Nullable error) {
        
    }];
}

- (void)testTestExpectation {
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Test expectation"];
    
    // 设置期望变为fulfilled状态前，fulfill需要被调用的次数。默认值为1
    expectation.expectedFulfillmentCount = 3;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        
        // 将fulfill被调用的次数加一
        [expectation fulfill];
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0f];
        
        [expectation fulfill];
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5.0f];
        
        [expectation fulfill];
    });
    
    [self waitForExpectations:@[expectation] timeout:3.0f];
}

- (void)testKVOExpectation {
    // 其中expectedValue是KVO期望监听到的值，在timeout之前，如果没有监听到expectedValue的值，则测试失败
    XCTKVOExpectation *kvoExpectation = [[XCTKVOExpectation alloc] initWithKeyPath:@"tag"
                                                                            object:self.testView
                                                                     expectedValue:@2];
    // 当handler不为nil时，expectedValue无效。
    // 每次keyPath的值有变化时，都会调用handler。
    // 返回值为YES时，测试通过。
    kvoExpectation.handler = ^BOOL(id  _Nonnull observedObject, NSDictionary * _Nonnull change) {
        return self.testView.tag == 3;
    };
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.testView.tag = 2;
        });
    });
    
    [self waitForExpectations:@[kvoExpectation] timeout:3.0f];
}

- (void)testNotificationExpectation {
    NSString *testNotificationName = @"testNotificationName";
    
    // 创建一个新的通知期望，这个期望监听一个指定的通知名
    // 如果设置了object，则通知必须是该object发出的
    // 如果设置了notificationCenter，则通知必须y是由这个notificationCenter发出的。如果没有设置，则需要由[NSNotificationCenter defaultCenter]发出
    // 当接收到满足以上条件的通知后，Expectation将会被置为fulfill
    XCTNSNotificationExpectation *notificationExpectation = [[XCTNSNotificationExpectation alloc] initWithName:testNotificationName
                                                                                                        object:self
                                                                                            notificationCenter:[NSNotificationCenter defaultCenter]];
    // 如果设置了handler，则Expectation是否为fulfill由handler的返回值来确定
    notificationExpectation.handler = ^BOOL(NSNotification * _Nonnull notification) {
        if ([notification.userInfo objectForKey:@"name"]) {
            return YES;
        }
        return NO;
    };
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:testNotificationName object:self userInfo:@{@"name" : @"Bujie"}];
        });
    });
    
    
    [self waitForExpectations:@[notificationExpectation] timeout:3.0f];
}

- (void)testPerdicateExpectation {
    NSMutableString *str = @"".mutableCopy;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] '4'"];
    // 当Predicate被满足时，XCTNSPredicateExpectation会被置为fulfill
    XCTNSPredicateExpectation *predicateExpectation = [[XCTNSPredicateExpectation alloc] initWithPredicate:predicate object:str];
    // 如果设置了handler，handler的代码会在Predicate被满足时执行。如果handler返回YES，则XCTNSPredicateExpectation会被置为fulfill
    predicateExpectation.handler = ^BOOL{
        return str.length <= 2;
    };
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0f];
        [str appendString:@"1"];
        
        [NSThread sleepForTimeInterval:1.0f];
        [str appendString:@"2"];
        
        [NSThread sleepForTimeInterval:1.0f];
        [str appendString:@"3"];
        
        [NSThread sleepForTimeInterval:1.0f];
        [str appendString:@"4"];
    });
    
    
    [self waitForExpectations:@[predicateExpectation] timeout:5.0f];
}

- (void)testWaiter {
    XCTestExpectation *expectation1 = [[XCTestExpectation alloc] initWithDescription:@"Test expectation 1"];
    XCTestExpectation *expectation2 = [[XCTestExpectation alloc] initWithDescription:@"Test expectation 2"];
    XCTestExpectation *expectation3 = [[XCTestExpectation alloc] initWithDescription:@"Test expectation 3"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0f];
        
        [expectation1 fulfill];
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4.0f];
        
        [expectation2 fulfill];
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.0f];
        
        [expectation3 fulfill];
    });
    
    XCTWaiter *waiter = [[XCTWaiter alloc] init];
    // 每个期望只能再期望数组中出现一次，否则测试直接出错
    // 如果所有期望不能在timeout之前fulfill，则结果为XCTWaiterResultTimedOut
    // 如果期望fulfill的顺序与Expectations中期望的顺序不一致，则结果为XCTWaiterResultIncorrectOrder（enforceOrder设置为YES时才有效）
    XCTWaiterResult waiterResult = [waiter waitForExpectations:@[expectation1, expectation2, expectation3]
                                                          timeout:5.0f
                                                     enforceOrder:YES];
    
    XCTAssertTrue(waiterResult == XCTWaiterResultCompleted, @"test fail");
    XCTAssertFalse(waiterResult == XCTWaiterResultTimedOut, @"test fail for timeout");
    XCTAssertFalse(waiterResult == XCTWaiterResultIncorrectOrder, @"test fail for incorrect order");
    
    // 已经fulfill的期望数组
    NSArray<XCTestExpectation *> *fulfilledExpectations = waiter.fulfilledExpectations;
    for (XCTestExpectation *expectation in fulfilledExpectations) {
        
    }
}


@end
