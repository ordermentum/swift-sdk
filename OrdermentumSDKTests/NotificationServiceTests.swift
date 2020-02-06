//
//  NotificationServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class NotificationServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUpdateNotificationSetting() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build request body and params
        let userId = ProcessInfo.processInfo.environment["USER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        var updateObject:[String: Bool] = [:]
        if let pushNotifications = ProcessInfo.processInfo.environment["PUSH_NOTIFICATIONS"] {
            updateObject["pushNotifications"] = pushNotifications.toBool()
        }
        if let enableSMS = ProcessInfo.processInfo.environment["ENABLE_SMS"] {
            updateObject["enableSMS"] = enableSMS.toBool()
        }
        if let enableEmail = ProcessInfo.processInfo.environment["ENABLE_EMAIL"] {
            updateObject["enableEmail"] = enableEmail.toBool()
        }
        if let sendInvoice = ProcessInfo.processInfo.environment["SEND_INVOICE"] {
            updateObject["sendInvoice"] = sendInvoice.toBool()
        }
        if let overdueOrders = ProcessInfo.processInfo.environment["OVERDUE_ORDERS"] {
            updateObject["overdueOrders"] = overdueOrders.toBool()
        }
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? NotificationsRouter.updateNotificationSetting(userId, supplierId, updateObject).asURLRequest() {
            self.startStub(route, stubData: .notificationSettingsUpdate )
        }
        
        //Call API
        Client.instance.notifications.updateNotificationSetting(userId: userId, supplierId: supplierId, updateObject: updateObject) { (result, err) in
                assert(result)
                expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
