//
//  HMXModelTests.m
//  UnitTestDemoTests
//
//  Created by 不介 on 2019/4/8.
//  Copyright © 2019 不介. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMXModel.h"

@interface HMXModelTests : XCTestCase

@end

/*
 1.1 HMXModel响应initWithModelType:title:方法
 1.2 HMXModel响应可以通过initWithModelType:title:方法创建实例对象
 1.3 HMXModel响应modelWithModelType:title:方法
 1.4 HMXModel响应可以通过modelWithModelType:title:方法创建实例对象
 
 2.1 HMXModel的type默认值是HMXModelTypeA
 2.2 HMXModel的type设置为有效值时，type的值与设置的值一致
 2.3 HMXModel的type设置为无效值时，type的值保持不变
 2.4 HMXModel的title设置值时，title值与设置的值一致
 
 3.1 HMXModel响应models方法
 3.2 HMXModel的models方法返回值不为nil，也不为空
 3.3 HMXModel的models方法返回的对象都是HMXModel实例
 */
@implementation HMXModelTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Model_Response_Method_initWithModelType_title {
    XCTAssertTrue([HMXModel instancesRespondToSelector:@selector(initWithModelType:title:)],
                  @"HMXModel可以响应initWithModelType:title:");
}

- (void)test_Model_Method_initWithModelType_title_Should_Create_Model {
    HMXModel *model = [[HMXModel alloc] initWithModelType:HMXModelTypeA title:@"Type A"];
    XCTAssertNotNil(model, @"HMXModel可以通过initWithModelType:title:来创建");
    
    XCTAssertEqual(model.type, HMXModelTypeA, @"HMXModel通过initWithModelType:title:来创建, type值正确");
    XCTAssertEqualObjects(model.title, @"Type A", @"HMXModel通过initWithModelType:title:来创建, title值正确");
}

- (void)test_Model_Response_Method_modelWithModelType_title {
    XCTAssertTrue([HMXModel respondsToSelector:@selector(modelWithModelType:title:)],
                  @"HMXModel可以响应modelWithModelType:title:");
}

- (void)test_Model_Method_modelWithModelType_title_Should_Create_Model {
    HMXModel *model = [HMXModel modelWithModelType:HMXModelTypeA title:@"Type A"];
    XCTAssertNotNil(model, @"HMXModel可以通过modelWithModelType:title:来创建");
    
    XCTAssertEqual(model.type, HMXModelTypeA, @"HMXModel通过modelWithModelType:title:来创建, type值正确");
    XCTAssertEqualObjects(model.title, @"Type A", @"HMXModel通过modelWithModelType:title:来创建, title值正确");
}

- (void)test_Model_Type_Default_Value_Is_HMXModelTypeA {
    HMXModel *model = [HMXModel modelWithModelType:0 title:@"Type A"];
    
    XCTAssertEqual(model.type, HMXModelTypeA, @"type的默认值是HMXModelTypeA");
}

- (void)test_Model_Type_Equal_To_New_Value_When_Set_Valid_Value {
    HMXModel *model = [HMXModel modelWithModelType:HMXModelTypeA title:@"Type A"];
    model.type = HMXModelTypeB;
    
    XCTAssertEqual(model.type, HMXModelTypeB, @"type设置为有效值时，type的值与设置的值一致");
}

- (void)test_Model_Type_Should_Not_Change_When_Set_Invalid_Value {
    HMXModel *model = [HMXModel modelWithModelType:HMXModelTypeB title:@"Type B"];
    model.type = 0;
    
    XCTAssertEqual(model.type, HMXModelTypeB, @"type设置为无效值时，type的值保持不变");
}

- (void)test_Model_Title_Equal_To_New_Value_When_Set_New_Value {
    HMXModel *model = [HMXModel modelWithModelType:HMXModelTypeB title:@"Type B"];
    model.title = @"Type A";
    
    XCTAssertEqualObjects(model.title, @"Type A", @"title设置值时，title值与设置的值一致");
}

- (void)test_Model_Response_Method_models {
    XCTAssertTrue([HMXModel respondsToSelector:@selector(models)], @"HMXModel响应models方法");
}

- (void)test_Model_Method_models_Returns_Should_NotBe_Nil_Or_Empty {
    NSArray *models = [HMXModel models];
    
    XCTAssertNotNil(models, @"HMXModel的models方法返回值不为nil");
    XCTAssertTrue(models.count, @"HMXModel的models方法返回值不为空");
}

- (void)test_Model_Method_models_Returns_ShouldBe_HMXModel_Array {
    NSArray *models = [HMXModel models];
    
    BOOL notExpectedClass = NO;
    for (HMXModel *model in models) {
        if (![model isKindOfClass:[HMXModel class]]) {
            notExpectedClass = YES;
            break;
        }
    }
    
    XCTAssertFalse(notExpectedClass, @"HMXModel的models方法返回的对象都是HMXModel实例");
}


@end
