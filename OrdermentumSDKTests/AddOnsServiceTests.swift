//
//  AddOnsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
import Hippolyte
@testable import OrdermentumSDK

class AddOnsServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        Hippolyte.shared.stop()
    }
    
    func testSearchAddons() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let entityType:String = ""
        let entityId:String = ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? AddOnsRouter.searchAddons(entityType, entityId).asURLRequest() {
            self.startStub(route, stubData: .addonsSearch )
        }
        
        //Call API
        Client.instance.addons.searchAddons(entityType: entityType, entityId: entityId) { (result, responseData, err) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDiscoverAddons() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let entityType:String = ""
        let entityId:String = ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? AddOnsRouter.discoverAddons(entityType, entityId).asURLRequest() {
            self.startStub(route, stubData: .addonsSearch )
        }
        
        //Call API
        Client.instance.addons.discoverAddons(entityType: entityType, entityId:entityId) { (result, responseData, err) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testReadAddon() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let entityType:String = ""
        let entityId:String = ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? AddOnsRouter.readAddon(entityType, entityId).asURLRequest() {
            self.startStub(route, stubData: .addOn )
        }
        
        //Call API
        Client.instance.addons.readAddon(addonId: "", accountId:"") { (result, responseData, err) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateAddon() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Update Request Object
        let addOnId = ""
        var requestObject: AddOnUpdateObject = AddOnUpdateObject()
        requestObject.accountId = ProcessInfo.processInfo.environment["ACCOUNT_ID"] ?? ""
        requestObject.expenseAccountCode = ProcessInfo.processInfo.environment["EXPENSE_ACCOUNT_CODE"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? AddOnsRouter.updateAddon(addOnId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .addOn )
        }
        
        //Call API
        Client.instance.addons.updateAddon(addonId: addOnId, requestObject: requestObject) { (result, responseData, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDisconnectAddon() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Disconnnect Request Object
        let addOnId = ""
        var requestObject: AddOnDisconnectObject = AddOnDisconnectObject()
        requestObject.accountId = ProcessInfo.processInfo.environment["ACCOUNT_ID"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? AddOnsRouter.disconnectAddon(addOnId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .empty )
        }
        
        //Call API
        Client.instance.addons.disconnectAddon(addonId: addOnId, requestObject: requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
}


