//
//  ProfileServiceTest.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte
@testable import OrdermentumSDK

class ProfileServiceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetProfile() {
        Client.instance.baseURL = ClientURL.rootTestingURL

        if let route = try? ProfileRouter.getProfile.asURLRequest() {
            self.startStub(route, stubData: .getProfile)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.profiles.getProfile { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed.")
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdateProfile() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let userId:String = self.getEnvironmentStrVar("USER_ID") ?? ""
        var requestObject: UpdateUserRequest = UpdateUserRequest()
        requestObject.email = self.getEnvironmentStrVar("EMAIL") ?? ""
        requestObject.firstName = self.getEnvironmentStrVar("FIRST_NAME") ?? ""
        requestObject.lastName = self.getEnvironmentStrVar("LAST_NAME") ?? ""
        requestObject.phone = self.getEnvironmentStrVar("PHONE") ?? ""
    
        if let route = try? ProfileRouter.updateProfile(userId, requestObject).asURLRequest() {
            self.startStub(route, stubData: .updateProfile)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        Client.instance.profiles.updateProfile(userId: userId, requestObject: requestObject) { (result) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed.")
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
