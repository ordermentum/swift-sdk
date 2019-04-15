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
        
        //Build Disconnnect Request Object
        var requestObject: Device = Device()
        requestObject.user_id = ProcessInfo.processInfo.environment["DEVICE_USER_ID"] ?? ""
        requestObject.primary_device_id = ProcessInfo.processInfo.environment["DEVICE_PRIMARY_ID"] ?? ""
        requestObject.secondary_device_id = ProcessInfo.processInfo.environment["DEVICE_SECONDARY_ID"] ?? ""
        requestObject.device_type = ProcessInfo.processInfo.environment["DEVICE_TYPE"] ?? ""
        requestObject.device_os_version = ProcessInfo.processInfo.environment["DEVICE_OS_VERSION"] ?? ""
        requestObject.device_hw_version = ProcessInfo.processInfo.environment["DEVICE_HW_VERSION"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        DeviceService().registerDevice(requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUnregisterDevice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Disconnnect Request Object
        var requestObject: Device = Device()
        requestObject.user_id = ProcessInfo.processInfo.environment["DEVICE_USER_ID"] ?? ""
        requestObject.primary_device_id = ProcessInfo.processInfo.environment["DEVICE_PRIMARY_ID"] ?? ""
        requestObject.secondary_device_id = ProcessInfo.processInfo.environment["DEVICE_SECONDARY_ID"] ?? ""
        requestObject.device_type = ProcessInfo.processInfo.environment["DEVICE_TYPE"] ?? ""
        requestObject.device_os_version = ProcessInfo.processInfo.environment["DEVICE_OS_VERSION"] ?? ""
        requestObject.device_hw_version = ProcessInfo.processInfo.environment["DEVICE_HW_VERSION"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        DeviceService().unregisterDevice(requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateVenueOperations() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Disconnnect Request Object
        var requestObject: VenueOperationsUpdate = VenueOperationsUpdate()
        requestObject.pos = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_POS"] ?? ""
        requestObject.venue = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_VENUE"] ?? ""
        requestObject.banking = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_BANKING"] ?? ""
        requestObject.accounting = ProcessInfo.processInfo.environment["DATA_ATTRIBUTE_ACCOUNTING"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        DeviceService().updateVenueOperations(retailerId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
