//
//  ValidationServiceTest.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte
import Alamofire
@testable import OrdermentumSDK

class ValidationServiceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidateItems() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ValidationRequestBody = ValidationRequestBody()
        requestObject.deliveryDate = ProcessInfo.processInfo.environment["DELIVERY_DATE"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["TYPE"] ?? ""
        requestObject.lineItems = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ValidationService().validateItems(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
    }
}
