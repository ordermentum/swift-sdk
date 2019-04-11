//
//  OrdersServiceTests.swift
//  ordermentum-swift-sdkTests
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import ordermentum_swift_sdk

class OrderServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDeliveryDates() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Call API
        Client.instance.setProductionURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        OrdersService().getDeliveryDates(retailerId: "", supplierId: "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetOrders() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Call API
        Client.instance.setProductionURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        OrdersService().getOrders(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", sortBy: "-1") { (result, responseData) in
            assert(responseData?.data != nil)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}