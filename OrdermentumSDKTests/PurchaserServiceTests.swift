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
        let retailerID: String = ""
        let supplierID: String = ""

        if let route = try? PurchaserRouter.getPurchasers(retailerID, supplierID).asURLRequest() {
            self.startStub(route, stubData: .getPurchasers)
        }

        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        Client.instance.purchasers.getPurchasers(retailerId: retailerID, supplierId: supplierID) { (result, _) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetPurchasersForPaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerID: String = ""
        let supplierID: String = ""
        let paymentMethodType = ""

        if let route = try? PurchaserRouter.getPurchasersForPaymentMethod(retailerID, supplierID).asURLRequest() {

            self.startStub(route, stubData: .getPurchaserForPaymentMethod)
        }

        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        Client.instance.purchasers.getPurchasersForPaymentMethod(retailerId: retailerID, paymentMethodType: paymentMethodType) { (result, _) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdatePaymentMethod() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let purchaserID: String = "414c664f-ccba-4385-9679-279cac329566"
        var updatePaymentMethodRequest: UpdatePaymentMethodRequest = UpdatePaymentMethodRequest()
        updatePaymentMethodRequest.paymentMethodId = "e7e54d1a-e01a-49d8-8899-4f8841b2f159"
        updatePaymentMethodRequest.defaultPaymentMethodType = "card"

        if let route = try? PurchaserRouter.updatePaymentMethod(purchaserID, updatePaymentMethodRequest).asURLRequest() {
            self.startStub(route, stubData: .updatePaymentMethod)
        }

        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        Client.instance.purchasers.updatePaymentMethod(purchaserId: purchaserID, requestObject: updatePaymentMethodRequest) { (result) in
            if result {
                assert(result)
                expectation.fulfill()
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
