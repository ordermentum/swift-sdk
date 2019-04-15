//
//  AddOnsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class AddOnsServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchAddons() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setProductionURL()
        AddOnsService().searchAddons(entityType: "", entityId: []) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDiscoverAddons() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setProductionURL()
        AddOnsService().discoverAddons(entityType: "", entityId:"") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testReadAddon() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setProductionURL()
        AddOnsService().readAddon(addonId: "", accountId:"") { (result, responseData) in
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
        var requestObject: AddOnUpdateObject = AddOnUpdateObject()
        requestObject.accountId = ProcessInfo.processInfo.environment["ACCOUNT_ID"] ?? ""
        requestObject.expenseAccountCode = ProcessInfo.processInfo.environment["EXPENSE_ACCOUNT_CODE"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        AddOnsService().updateAddon(addonId: "", accountId: "", requestObject: requestObject) { (result, responseData) in
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
        var requestObject: AddOnDisconnectObject = AddOnDisconnectObject()
        requestObject.accountId = ProcessInfo.processInfo.environment["ACCOUNT_ID"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        AddOnsService().disconnectAddon(addonId: "", accountId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
}


