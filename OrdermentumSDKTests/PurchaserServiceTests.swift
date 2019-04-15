//
//  PurchaserServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK


class PurchaserServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetPurchasers() {
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: PurchaserResponse = PurchaserResponse()
        requestObject.data = []
        requestObject.links = Links()
        
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PurchaserService().getPurchasers(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "") { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetPurchasersForPaymentMethod() {
        //Build Request Object
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: PurchaserResponse = PurchaserResponse()
        requestObject.data = []
        requestObject.links = Links()
    
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PurchaserService().getPurchasersForPaymentMethod(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", paymentMethodType: ProcessInfo.processInfo.environment["PAYMENT_METHOD"] ?? "") { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testUpdatePaymentMethod() {
        //Build Request Object
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: UpdatePaymentMethodRequest = UpdatePaymentMethodRequest()
        requestObject.defaultPaymentMethodType = ProcessInfo.processInfo.environment["PAYMENT_METHOD"] ?? ""
        requestObject.paymentMethodId = ProcessInfo.processInfo.environment["PAYMENT_METHOD_ID"] ?? ""
        
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PurchaserService().updatePaymentMethod(purchaserId: ProcessInfo.processInfo.environment["PURCHASER_ID"] ?? "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
    }
    
}
