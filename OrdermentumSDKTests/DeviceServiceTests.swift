//
//  DeviceServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class DeviceServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterDevice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Device Request Object
        var requestObject: Device = Device()
        requestObject.user_id = ProcessInfo.processInfo.environment["DEVICE_USER_ID"] ?? ""
        requestObject.primary_device_id = ProcessInfo.processInfo.environment["DEVICE_PRIMARY_ID"] ?? ""
        requestObject.secondary_device_id = ProcessInfo.processInfo.environment["DEVICE_SECONDARY_ID"] ?? ""
        requestObject.device_type = ProcessInfo.processInfo.environment["DEVICE_TYPE"] ?? ""
        requestObject.device_os_version = ProcessInfo.processInfo.environment["DEVICE_OS_VERSION"] ?? ""
        requestObject.device_hw_version = ProcessInfo.processInfo.environment["DEVICE_HW_VERSION"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? DeviceRouter.registerDevice(requestObject).asURLRequest() {
            self.startStub(route, stubData: .dataAttributesResponse )
        }
        
        //Call API
        Client.instance.devices.registerDevice(requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUnregisterDevice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Device Request Object
        var requestObject: Device = Device()
        requestObject.user_id = ProcessInfo.processInfo.environment["DEVICE_USER_ID"] ?? ""
        requestObject.primary_device_id = ProcessInfo.processInfo.environment["DEVICE_PRIMARY_ID"] ?? ""
        requestObject.secondary_device_id = ProcessInfo.processInfo.environment["DEVICE_SECONDARY_ID"] ?? ""
        requestObject.device_type = ProcessInfo.processInfo.environment["DEVICE_TYPE"] ?? ""
        requestObject.device_os_version = ProcessInfo.processInfo.environment["DEVICE_OS_VERSION"] ?? ""
        requestObject.device_hw_version = ProcessInfo.processInfo.environment["DEVICE_HW_VERSION"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? DeviceRouter.unregisterDevice(requestObject).asURLRequest() {
            self.startStub(route, stubData: .empty )
        }
        
        //Call API
        Client.instance.devices.unregisterDevice(requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateVenueOperations() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build VenueOperationsUpdate Request Object
        var requestObject: VenueOperationsUpdate = VenueOperationsUpdate()
        requestObject.pos = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_POS"] ?? ""
        requestObject.venue = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_VENUE"] ?? ""
        requestObject.banking = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_BANKING"] ?? ""
        requestObject.accounting = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_ACCOUNTING"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        
        //Stubbing
        if let route = try? DataAttributesRouter.updateVenueOperations("", requestObject).asURLRequest() {
            self.startStub(route, stubData: .empty )
        }
        
        //Call API
        Client.instance.devices.updateVenueOperations(retailerId: "", requestObject: requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
