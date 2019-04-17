//
//  ProfileServiceTest.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class ProfileServiceTest: XCTestCase {

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

    func testGetProfile() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        let _: UserProfile = UserProfile()
        
        ProfileService().getProfile { (result, requestObjects) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testUpdateProfile() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        var requestObject: UpdateUserRequest = UpdateUserRequest()
        requestObject.email = ProcessInfo.processInfo.environment["EMAIL"] ?? ""
        requestObject.firstName = ProcessInfo.processInfo.environment["FIRST_NAME"] ?? ""
        requestObject.lastName = ProcessInfo.processInfo.environment["LAST_NAME"] ?? ""
        requestObject.phone = ProcessInfo.processInfo.environment["PHONE"] ?? ""
        
        ProfileService().updateProfile(userId: ProcessInfo.processInfo.environment["USER_ID"] ?? "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
