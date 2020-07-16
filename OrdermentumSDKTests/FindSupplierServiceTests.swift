//
//  FindSupplierServiceTests.swift
//  ordermentum-swift-sdkTests
//
//  Created by Brandon Stillitano on 10/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class FindSupplierServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSupplierRequest() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Request Object
        var requestObject: FindSupplierRequest = FindSupplierRequest()
        requestObject.existing = true
        requestObject.message = "iOS Test Suite is sending this request. Please ignore it brother."
        requestObject.retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        requestObject.source = "iOS Test Suite"
        requestObject.recommended = true
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        FindSupplierService().sendSupplierEnquiry(requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
