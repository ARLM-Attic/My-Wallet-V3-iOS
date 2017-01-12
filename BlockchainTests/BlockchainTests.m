//
//  BlockchainTests.m
//  BlockchainTests
//
//  Created by Kevin Wu on 4/14/16.
//  Copyright © 2016 Qkos Services Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KIFUITestActor+Login.h"
#import "LocalizationConstants.h"

@interface BlockchainTests : XCTestCase

@end

@implementation BlockchainTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
//    [tester goToSend];
//    [tester typeInAddress];
//    
//    [tester confirmSendAmountDecimalPeriod];
//    [tester confirmSendAmountDecimalComma];
//    [tester confirmSendAmountDecimalArabicComma];
    
    [tester goToReceive];
    [tester confirmReceiveAmountDecimalPeriod];
    [tester confirmReceiveAmountDecimalComma];
    [tester confirmReceiveAmountDecimalArabicComma];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
