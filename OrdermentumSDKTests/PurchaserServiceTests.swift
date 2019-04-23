//
//  PurchaserServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte

@testable import OrdermentumSDK


class PurchaserServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetPurchasers() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerID:String = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierID:String = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let method = self.getRouterMethod(url: PurchaserRouter.getPurchasers(retailerID, supplierID))

        if let route = try? PurchaserRouter.getPurchasers(retailerID, supplierID).asURLRequest() {
            self.startStub(route, method: HTTPMethod(rawValue: method)!, stubData: .GetPurchasers)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.purchasers.getPurchasers(retailerId: retailerID, supplierId: supplierID) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed.")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetPurchasersForPaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerID:String = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierID:String = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let paymentMethodType = ProcessInfo.processInfo.environment["PAYMENT_METHOD_TYPE"] ?? ""
        let method = self.getRouterMethod(url: PurchaserRouter.getPurchasersForPaymentMethod(retailerID, supplierID))
        
        if let route = try? PurchaserRouter.getPurchasersForPaymentMethod(retailerID, supplierID).asURLRequest() {
            self.startStub(route, method: HTTPMethod(rawValue: method)!, stubData: .GetPurchaserForPaymentMethod)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.purchasers.getPurchasersForPaymentMethod(retailerId: retailerID, paymentMethodType: paymentMethodType) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed.")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdatePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let purchaserID:String = ProcessInfo.processInfo.environment["PURCHASER_ID"] ?? ""
        var updatePaymentMethodRequest:UpdatePaymentMethodRequest =  UpdatePaymentMethodRequest()
        updatePaymentMethodRequest.paymentMethodId = ProcessInfo.processInfo.environment["PAYMENT_METHOD_ID"] ?? ""
        updatePaymentMethodRequest.defaultPaymentMethodType = ProcessInfo.processInfo.environment["DEFAULT_PAYMENTMETHOD"] ?? ""
        
        let method = self.getRouterMethod(url: PurchaserRouter.updatePaymentMethod(purchaserID, updatePaymentMethodRequest))
        
        if let route = try? PurchaserRouter.updatePaymentMethod(purchaserID, updatePaymentMethodRequest).asURLRequest() {
            self.startStub(route, method: HTTPMethod(rawValue: method)!, stubData: .UpdatePaymentMethod)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.purchasers.updatePaymentMethod(purchaserId: purchaserID, requestObject: updatePaymentMethodRequest) { (result) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed.")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)

    }
    
}
