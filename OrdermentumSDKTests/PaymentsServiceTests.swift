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
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        
        if let route = try? PaymentsRouter.getPaymentMethods(retailerId).asURLRequest() {
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, stubData: .getPaymentMethods)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.payments.getPaymentMethods(retailerId: retailerId) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetSinglePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let paymentMethodId: String = self.getEnvironmentVar("PAYMENTMETHOD_ID") ?? ""

        if let route = try? PaymentsRouter.getSinglePaymentMethod(retailerId, paymentMethodId).asURLRequest() {
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, stubData: .getSinglePaymentMethods)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.payments.getSinglePaymentMethod(retailerId: retailerId, paymentMethodId: paymentMethodId) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCreateCardPaymentMethod(){
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        var requestObject: CreateCardPaymentMethodRequest = CreateCardPaymentMethodRequest()

        requestObject.number = self.getEnvironmentVar("CARD_NUMBER") ?? ""
        requestObject.issuer = self.getEnvironmentVar("CARD_ISSUER") ?? ""
        requestObject.isCard = Bool(self.getEnvironmentVar("ISCARD")!) ?? true
        requestObject.firstName = self.getEnvironmentVar("FIRST_NAME") ?? "TEST NAME"
        requestObject.lastName = self.getEnvironmentVar("LAST_NAME") ?? ""
        requestObject.fullName = self.getEnvironmentVar("FULL_NAME") ?? ""
        requestObject.expiryMonth = self.getEnvironmentVar("EXPIRY_MONTH") ?? ""
        requestObject.expiryYear = self.getEnvironmentVar("EXPIRY_YEAR") ?? ""
        requestObject.cvv = self.getEnvironmentVar("CVV") ?? ""
        requestObject.isDirect = Bool(self.getEnvironmentVar("ISDIRECT")!) ?? true
        requestObject.defaultAll = Bool(self.getEnvironmentVar("DEFAULT_ALL")!) ?? true
        requestObject.userId = self.getEnvironmentVar("CARD_URSERID") ?? ""
        
        if let route = try? PaymentsRouter.createCardPaymentMethod(retailerId, requestObject).asURLRequest() {
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, stubData: .createCardPaymentMethod)
        }
        
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        //Call API
 		Client.instance.payments.createCardPaymentMethod(retailerId: retailerId, requestObject: requestObject) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse(responseData?.account.isEmpty ?? false)
                XCTAssertFalse(responseData?.accountName.isEmpty ?? false)
                XCTAssertTrue(responseData!.bankConfigured)
                XCTAssertFalse(responseData?.bsb.isEmpty ?? false)
                XCTAssertTrue(responseData!.cardConfigured)
                XCTAssertFalse(responseData?.cardLast4Digits.isEmpty ?? false)
                XCTAssertFalse(responseData?.cardName.isEmpty ?? false)
                XCTAssertFalse(responseData?.cardType.isEmpty ?? false)
                XCTAssertFalse(responseData?.createdAt.isEmpty ?? false)
                XCTAssertFalse(responseData?.displayName.isEmpty ?? false)
                XCTAssertFalse(responseData?.firstName.isEmpty ?? false)
                XCTAssertFalse(responseData?.id.isEmpty ?? false)
                XCTAssertTrue(responseData!.isCard)
                XCTAssertTrue(responseData!.isDirect)
                XCTAssertFalse(responseData?.lastName.isEmpty ?? false)
                XCTAssertFalse(responseData?.maskedNumber.isEmpty ?? false)
                XCTAssertFalse(responseData?.name.isEmpty ?? false)
                XCTAssertFalse(responseData?.title.isEmpty ?? false)
                XCTAssertFalse(responseData?.type.isEmpty ?? false)
                XCTAssertFalse(responseData?.updatedAt.isEmpty ?? false)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    

    func testDeletePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let paymentMethodId: String = self.getEnvironmentVar("PAYMENTMETHOD_ID") ?? ""
        
        if let route = try? PaymentsRouter.deletePaymentMethod(retailerId, paymentMethodId).asURLRequest() {
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, stubData: .deletePaymentMethod)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.payments.deletePaymentMethod(retailerId: retailerId, paymentMethodId: paymentMethodId) { (result) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
