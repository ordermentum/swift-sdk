//
//  NotifyServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
import Hippolyte
@testable import OrdermentumSDK

class NotifyServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterDevice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Request body and params
        var requestObject: NotifyBody = NotifyBody()
        requestObject.userId = ProcessInfo.processInfo.environment["USER_ID"] ?? ""
        requestObject.deviceId = ProcessInfo.processInfo.environment["DEVICE_ID"] ?? ""
        requestObject.deviceToken = ProcessInfo.processInfo.environment["DEVICE_TOKEN"] ?? ""
        requestObject.deviceType = ProcessInfo.processInfo.environment["DEVICE_TYPE"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? NotifyRouter.registerDevice(requestObject).asURLRequest() {
            self.startStub(route, stubData: .registerDevice )
        }
        
        //Call API
        Client.instance.notify.registerDevice(requestObject){ (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
