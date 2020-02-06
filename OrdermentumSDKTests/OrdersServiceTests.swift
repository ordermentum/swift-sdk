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
        //lineItemsJSONString should be a valid JSON string
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
        Client.instance.orders.submitOrder(requestObject) { (result, responseData, err) in
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
        //lineItemsJSONString should be a valid JSON string
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
        Client.instance.orders.submitStandingOrder(requestObject) { (result, responseData, err) in
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
        Client.instance.orders.getDeliveryDates(retailerId: retailerId, supplierId: supplierId) { (result, responseData, err) in
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
        let sortBy = ProcessInfo.processInfo.environment["SORT"] ?? "-1"
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.getOrders(retailerId, supplierId, sortBy, "-1", 1).asURLRequest() {
            self.startStub(route, stubData: .getOrders )
        }
        
        //Call API
        Client.instance.orders.getOrders(retailerId: retailerId, supplierId: supplierId, sortBy: sortBy, sortOrder: "1", pageNo: 1) { (result, responseData, err) in
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
        Client.instance.orders.removeFavourite(orderId: orderId) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetFavourites() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let type = ProcessInfo.processInfo.environment["ORDER_TYPE"] ?? ""
        let sortBy = ProcessInfo.processInfo.environment["SORT"] ?? "-1"
        let page = Int(ProcessInfo.processInfo.environment["PAGE"] ?? "-1")!
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.getFavourites(retailerId, supplierId, type, sortBy, page).asURLRequest() {
            self.startStub(route, stubData: .getFavourites )
        }
        
        //Call API
        Client.instance.orders.getFavourites(retailerId: retailerId, supplierId: supplierId, type: type, sortBy: sortBy, pageNo: page) { (result, responseData, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetClassicStandingOrders() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let enabled = (ProcessInfo.processInfo.environment["ENABLED"] ?? "").toBool()
        let sortBy = ProcessInfo.processInfo.environment["SORT"] ?? "-1"
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.getClassicStandingOrders(retailerId, supplierId, enabled, sortBy).asURLRequest() {
            self.startStub(route, stubData: .getClassicStandingOrders )
        }
        
        //Call API
        Client.instance.orders.getClassicStandingOrders(retailerId: retailerId, supplierId: supplierId, enabled: enabled, sortBy: sortBy) { (result, responseData, err) in
            assert(responseData?.data != nil)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateOrderFirstTime() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build lineItems array for UpdateOrderFirstTime object
        //lineItemsJSONString should be a valid JSON string
        let lineItemsJSONString = ProcessInfo.processInfo.environment["CREATE_ORDER_LINE_ITEMS"] ?? ""
        let lineItems: [UpdateOrderRequestLineItem] = parseLineItems(from: lineItemsJSONString)
        
        //Build request body and params
        var requestObject:UpdateScheduleRequest = UpdateScheduleRequest()
        requestObject.lineItems = lineItems
        requestObject.cutOff = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_CUTOFF"] ?? ""
        requestObject.purchaserScheduleId = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_PURCHASER_SCHEDULE_ID"] ?? ""
        requestObject.runAt = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_RUN_AT"] ?? ""
        requestObject.scheduleId = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_SCHEDULE_ID"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["UPDATE_SCHEDULE_TYPE"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.updateOrderFirstTime(requestObject).asURLRequest() {
            self.startStub(route, stubData: .updateOrderFirstTime )
        }
        
        //Call API
        Client.instance.orders.updateOrderFirstTime(requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateOrder() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build lineItems array for UpdateOrder object
        //lineItemsJSONString should be a valid JSON string
        let lineItemsJSONString = ProcessInfo.processInfo.environment["UPDATE_ORDER_LINE_ITEMS"] ?? ""
        let lineItems: [UpdateOrderRequestLineItem] = parseLineItems(from: lineItemsJSONString)
        
        //Build request body and params
        let orderId = ProcessInfo.processInfo.environment["ORDER_ID"] ?? ""
        var requestObject:UpdateOrderRequest = UpdateOrderRequest()
        requestObject.lineItems = lineItems
        requestObject.name = ProcessInfo.processInfo.environment["UPDATE_ORDER_NAME"] ?? ""
        requestObject.origin = ProcessInfo.processInfo.environment["UPDATE_ORDER_ORIGIN"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["UPDATE_ORDER_TYPE"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.updateOrder(orderId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .updateOrder )
        }
        
        //Call API
        Client.instance.orders.updateOrder(orderId: orderId, requestObject: requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCreateFavourite() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build lineItems array for UpdateOrder object
        //lineItemsJSONString should be a valid JSON string
        let lineItemsJSONString = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_LINE_ITEMS"] ?? ""
        let lineItems: [CreateFavouriteRequestLineItem] = parseLineItems(from: lineItemsJSONString)
        
        //Build request body and params
        var requestObject:CreateFavouriteRequest = CreateFavouriteRequest()
        requestObject.lineItems = lineItems
        requestObject.comment = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_COMMENT"] ?? ""
        requestObject.deliveryDate = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_DELIVERY_DATE"] ?? ""
        requestObject.origin = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_ORIGIN"] ?? ""
        requestObject.reference = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_REFERENCE"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_RETAILER_ID"] ?? ""
        requestObject.status = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_STATUS"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["CREATE_FAVORITE_ORDER_TYPE"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.createFavouriteOrder(requestObject).asURLRequest() {
            self.startStub(route, stubData: .createFavourite )
        }
        
        //Call API
        Client.instance.orders.createFavourite(requestObject) { (result, responseData, err)  in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func skipped_testScheduleOrder(){
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let purchaserScheduleId = ProcessInfo.processInfo.environment["PURCHASER_SCHEDULE_ID"] ?? ""
        var requestObject:CreatePurchaserSchedule = CreatePurchaserSchedule()
        requestObject.orderId = ProcessInfo.processInfo.environment["SCHEDULE_ORDER_ID"] ?? ""
        requestObject.place = (ProcessInfo.processInfo.environment["SCHEDULE_PLACE"] ?? "").toBool()
        requestObject.retailerId = ProcessInfo.processInfo.environment["SCHEDULE_RETAILER_ID"] ?? ""
        requestObject.startDate = ProcessInfo.processInfo.environment["SCHEDULE_START_DATE"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["SCHEDULE_SUPPLIER_ID"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? OrdersRouter.scheduleOrder(purchaserScheduleId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .scheduleOrder )
        }
        
        //Call API
//        Client.instance.orders.scheduleOrder(purchaserScheduleId: purchaserScheduleId, requestObject: requestObject) { (result) in
//            assert(result)
//            expectation.fulfill()
//        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}

extension OrderServiceTests {
    public func parseLineItems<LineItem: Decodable>(from jsonString:String) -> [LineItem] {
        var result: [LineItem] = []
        if !jsonString.isEmpty {
            let jsonData = jsonString.data(using: .utf8) ?? Data()
            if let json = try? JSONSerialization.jsonObject(with: jsonData), let array = json as? [LineItem] {
                result = array
            }
        }
        
        return result
    }
}
