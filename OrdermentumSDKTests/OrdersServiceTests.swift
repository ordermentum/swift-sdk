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
        
        let lineItemsJSONString = ProcessInfo.processInfo.environment["CREATE_ORDER_LINE_ITEMS"] ?? ""
        let lineItems: [CreateOrderLineItem] = parseLineItems(from: lineItemsJSONString)

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
            self.startStub(route, stubData: .submitOrder )
        }
        
        //Call API
        Client.instance.orders.submitOrder(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSubmitStandingOrder() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build lineItems array for CreateOrder object
        let lineItemsJSONString = ProcessInfo.processInfo.environment["CREATE_STANDING_ORDER_LINE_ITEMS"] ?? ""
        let lineItems: [CreateOrderLineItem] = parseLineItems(from: lineItemsJSONString)
        
        //Build request body and params
        var requestObject:CreateStandingOrder = CreateStandingOrder()
        requestObject.lineItems = lineItems
        requestObject.origin = ProcessInfo.processInfo.environment["CREATE_STANDING_ORDER_ORIGIN"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["CREATE_STANDING_ORDER_RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["CREATE_STANDING_ORDER_SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["CREATE_STANDING_ORDER_TYPE"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.submitStandingOrder(requestObject).asURLRequest() {
            self.startStub(route, stubData: .submitStandingOrder )
        }
        
        //Call API
        Client.instance.orders.submitStandingOrder(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetDeliveryDates() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build request body and params
        let retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.getDeliveryDates(retailerId, supplierId).asURLRequest() {
            self.startStub(route, stubData: .getDeliveryDates )
        }
        
        //Call API
        Client.instance.orders.getDeliveryDates(retailerId: retailerId, supplierId: supplierId) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetOrders() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build request body and params
        let retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let sortBy = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "-1"
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.getOrders(retailerId, supplierId, sortBy).asURLRequest() {
            self.startStub(route, stubData: .getOrders )
        }
        
        //Call API
        OrdersService().getOrders(retailerId: retailerId, supplierId: supplierId, sortBy: sortBy) { (result, responseData) in
            assert(responseData?.data != nil)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRemoveFavourite() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let orderId = ProcessInfo.processInfo.environment["ORDER_ID"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.removeFavourite(orderId).asURLRequest() {
            self.startStub(route, stubData: .removeFavourite )
        }
        
        //Call API
        Client.instance.orders.removeFavourite(orderId: orderId) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}

extension OrderServiceTests {
    func parseLineItems(from jsonString:String) -> [CreateOrderLineItem] {
        var result: [CreateOrderLineItem] = []
        if !jsonString.isEmpty {
            let jsonData = jsonString.data(using: .utf8) ?? Data()
            if let json = try? JSONSerialization.jsonObject(with: jsonData), let array = json as? [CreateOrderLineItem] {
                result = array
            }
        }
        
        return result
    }
}
