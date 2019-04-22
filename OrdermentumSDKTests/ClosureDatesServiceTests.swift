//
//  ClosureDatesServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class ClosureDatesServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetClosurePeriods() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.closureDates.getClosurePeriods("", 0, 0) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCreateClosurePeriod() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build ClosurePeriod Request Object
        var requestObject: ClosurePeriod = ClosurePeriod()
        requestObject.id = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_ID"] ?? ""
        requestObject.name = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_NAME"] ?? ""
        requestObject.userId = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_USER_ID"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_RETAILER_ID"] ?? ""
        requestObject.startDate = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_START_DATE"] ?? ""
        requestObject.endDate = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_END_DATE"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.closureDates.createClosurePeriod(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateClosurePeriod() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build ClosurePeriod Request Object
        var requestObject: ClosurePeriod = ClosurePeriod()
        requestObject.id = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_ID"] ?? ""
        requestObject.name = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_NAME"] ?? ""
        requestObject.userId = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_USER_ID"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_RETAILER_ID"] ?? ""
        requestObject.startDate = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_START_DATE"] ?? ""
        requestObject.endDate = ProcessInfo.processInfo.environment["CLOSURE_PERIOD_END_DATE"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.closureDates.updateClosurePeriod(closurePeriodId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeleteClosurePeriod() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.closureDates.deleteClosurePeriod(closurePeriodId: "") { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
}