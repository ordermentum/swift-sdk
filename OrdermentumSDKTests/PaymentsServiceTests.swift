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
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, method: method, stubData: .GetPaymentMethods)
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
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, method: method, stubData: .GetSinglePaymentMethods)
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
        let requestObject: CreateCardPaymentMethodRequest = CreateCardPaymentMethodRequest()
        
        if let route = try? PaymentsRouter.createCardPaymentMethod(retailerId, requestObject).asURLRequest() {
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, method: method, stubData: .CreateCardPaymentMethod)
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
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, method: method, stubData: .DeletePaymentMethod)
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
