//
//  PaymentsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte
@testable import OrdermentumSDK


class PaymentsServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetPaymentMethods() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = ""
        
        if let route = try? PaymentsRouter.getPaymentMethods(retailerId).asURLRequest() {
            self.startStub(route, stubData: .GetPaymentMethods)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.payments.getPaymentMethods(retailerId: retailerId) { (result, [PaymentMethod]?) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetSinglePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = ""
        let paymentMethodId: String = ""

        if let route = try? PaymentsRouter.getSinglePaymentMethod(retailerId, paymentMethodId).asURLRequest() {
            self.startStub(route, stubData: .GetSinglePaymentMethods)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.payments.getSinglePaymentMethod(retailerId: retailerId, paymentMethodId: paymentMethodId) { (result, PaymentMethod) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCreateCardPaymentMethod(){
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = ""
        var requestObject: CreateCardPaymentMethodRequest = CreateCardPaymentMethodRequest()
        
        requestObject.number = ProcessInfo.processInfo.environment["CARD_NUMBER"] ?? ""
        requestObject.issuer = ProcessInfo.processInfo.environment["CARD_ISSUER"] ?? ""
        requestObject.isCard = true
        requestObject.firstName = ProcessInfo.processInfo.environment["CARD_FIRST_NAME"] ?? ""
        requestObject.lastName = ProcessInfo.processInfo.environment["CARD_LAST_NAME"] ?? ""
        requestObject.fullName = ProcessInfo.processInfo.environment["CARD_FULL_NAME"] ?? ""
        requestObject.expiryMonth = ProcessInfo.processInfo.environment["CARD_EXPIRY_MONTH"] ?? ""
        requestObject.expiryYear = ProcessInfo.processInfo.environment["CARD_EXPIRY_YEAR"] ?? ""
        requestObject.cvv = ProcessInfo.processInfo.environment["CARD_CVV"] ?? ""
        requestObject.isDirect = true
        requestObject.defaultAll = true
        requestObject.userId = ProcessInfo.processInfo.environment["CARD_USER_ID"] ?? ""

        if let route = try? PaymentsRouter.createCardPaymentMethod(retailerId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .CreateCardPaymentMethod)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.payments.createCardPaymentMethod(retailerId: retailerId, requestObject: requestObject) { (result, PaymentMethod) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeletePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = ""
        let paymentMethodId: String = ""
        
        if let route = try? PaymentsRouter.deletePaymentMethod(retailerId, paymentMethodId).asURLRequest() {
            self.startStub(route, stubData: .DeletePaymentMethod)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.payments.deletePaymentMethod(retailerId: retailerId, paymentMethodId: paymentMethodId) { (result) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
