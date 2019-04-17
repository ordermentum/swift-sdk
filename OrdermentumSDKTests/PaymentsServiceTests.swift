//
//  PaymentsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK


class PaymentsServiceTests: XCTestCase {

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
    
    func testGetPaymentMethods() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PaymentsService().getPaymentMethods(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetSinglePaymentMethod() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PaymentsService().getSinglePaymentMethod(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", paymentMethodId: ProcessInfo.processInfo.environment["PAYMENT_METHOD_ID"] ?? "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCreateCardPaymentMethod(){
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
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

        //Call API
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PaymentsService().createCardPaymentMethod(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", requestObject: requestObject) { (result, resposeData) in
            assert(result)
            expectation.fulfill()
        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDeletePaymentMethod() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        PaymentsService().deletePaymentMethod(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", paymentMethodId: ProcessInfo.processInfo.environment["PAYMENT_METHOD_ID"] ?? "") { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
