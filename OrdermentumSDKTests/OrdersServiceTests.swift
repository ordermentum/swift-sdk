//
//  OrdersServiceTests.swift
//  ordermentum-swift-sdkTests
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class OrderServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSubmitOrder() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build lineItems array for CreateOrder object
        var lineItems: [CreateOrderLineItem] = []
        let lineItemsJSONString = ProcessInfo.processInfo.environment["CREATE_ORDER_LINE_ITEMS"] ?? ""
        if !lineItemsJSONString.isEmpty {
            let lineItemsJSONData = lineItemsJSONString.data(using: .utf8) ?? Data()
            if let json = try? JSONSerialization.jsonObject(with: lineItemsJSONData), let array = json as? [CreateOrderLineItem] {
                lineItems = array
            }
        }

        //Build request body and params
        var requestObject:CreateOrder = CreateOrder()
        requestObject.lineItems = lineItems
        requestObject.comment = ProcessInfo.processInfo.environment["CREATE_ORDER_COMMENT"] ?? ""
        requestObject.deliveryDate = ProcessInfo.processInfo.environment["CREATE_ORDER_DELIVERY_DATE"] ?? ""
        requestObject.origin = ProcessInfo.processInfo.environment["CREATE_ORDER_ORIGIN"] ?? ""
        requestObject.reference = ProcessInfo.processInfo.environment["CREATE_ORDER_REFERENCE"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["CREATE_ORDER_RETAILER_ID"] ?? ""
        requestObject.status = ProcessInfo.processInfo.environment["CREATE_ORDER_STATUS"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["CREATE_ORDER_SUPPLIER_ID"] ?? ""
        requestObject.tokenId = ProcessInfo.processInfo.environment["CREATE_ORDER_TOKEN_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["CREATE_ORDER_TYPE"] ?? ""
        requestObject.paymentMethodId = ProcessInfo.processInfo.environment["CREATE_ORDER_PAYMENT_METHOD_ID"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.submitOrder(requestObject).asURLRequest() {
            self.startStub(route, stubData: .OrderSubmit )
        }
        
        //Call API
        Client.instance.orders.submitOrder(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetDeliveryDates() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
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
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        OrdersService().getOrders(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", sortBy: "-1") { (result, responseData) in
            assert(responseData?.data != nil)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
