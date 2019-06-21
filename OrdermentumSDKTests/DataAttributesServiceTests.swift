//
//  DataAttributesServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class DataAttributesServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func skipped_testGetDataAttributes() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
//        Client.instance.dataAttributes.getDataAttributes(purchaserId: "", pageSize:0, pageNo:0) { (result, responseData) in
//            assert(result)
//            expectation.fulfill()
//        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateVenueHours() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build TradingHours for DataAttributes Request Object
        var tradingHoursObj: TradingHours = TradingHours()
        let tradingHoursJSONString = ProcessInfo.processInfo.environment["DATA_ATTRIBUTES_TRADING_HOURS"] ?? ""
        if !tradingHoursJSONString.isEmpty {
            let tradingHoursJSONData = tradingHoursJSONString.data(using: .utf8) ?? Data()
            if let tradingHours = try? JSONDecoder().decode(TradingHours.self, from: tradingHoursJSONData) {
                tradingHoursObj = tradingHours
            }
        }
        
        //Build DataAttributes Request Object
        var requestObject: DataAttributes = DataAttributes()
        requestObject.tradingHours = tradingHoursObj
        requestObject.pos = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_POS"] ?? ""
        requestObject.venue = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_VENUE"] ?? ""
        requestObject.banking = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_BANKING"] ?? ""
        requestObject.accounting = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_ACCOUNTING"] ?? ""
        requestObject.venueTypes = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_VENUE_TYPES"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.dataAttributes.updateVenueHours(retailerId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateVenueOperations() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build VenueOperationsUpdate Request Object
        var requestObject: VenueOperationsUpdate = VenueOperationsUpdate()
        requestObject.pos = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_POS"] ?? ""
        requestObject.venue = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_VENUE"] ?? ""
        requestObject.banking = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_BANKING"] ?? ""
        requestObject.accounting = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_ACCOUNTING"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.dataAttributes.updateVenueOperations(retailerId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
