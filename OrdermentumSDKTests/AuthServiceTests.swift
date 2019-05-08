//
//  AuthServiceTests.swift
//  ordermentum-swift-sdkTests
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class AuthServiceTests: XCTestCase {
    
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
    
    func testLogin() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build Login Object
        var loginRequest: LoginRequest = LoginRequest()
        loginRequest.username = ProcessInfo.processInfo.environment["LOGIN_USERNAME"] ?? ""
        loginRequest.password = ProcessInfo.processInfo.environment["LOGIN_PASSWORD"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootURL
        Client.instance.auth.login(loginRequest) { (result, loginObject) in
            XCTAssertNotNil(loginObject?.access_token)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRequestPasswordReset() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Request Object
        var requestObject: ForgotPasswordRequest = ForgotPasswordRequest()
        requestObject.email = ProcessInfo.processInfo.environment["PASSWORD_RESET_EMAIL"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootURL
        Client.instance.auth.requestPasswordReset(requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testChangePassword() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Request Object
        var requestObject: ChangePasswordRequest = ChangePasswordRequest()
        requestObject.userId = ProcessInfo.processInfo.environment["USER_ID"] ?? ""
        requestObject.oldPassword = ProcessInfo.processInfo.environment["CHANGE_PASSWORD_OLD"] ?? ""
        requestObject.password = ProcessInfo.processInfo.environment["CHANGE_PASSWORD_NEW"] ?? ""
        requestObject.verifyPassword = ProcessInfo.processInfo.environment["CHANGE_PASSWORD_VERIFY"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        Client.instance.auth.changePassword(userId: ProcessInfo.processInfo.environment["USER_ID"] ?? "", requestObject: requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testResendVerifyEmail() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Request Object
        let resetToken = ProcessInfo.processInfo.environment["RESET_TOKEN"] ?? ""
        
        //Request Setup
        Client.instance.baseURL = ClientURL.rootURL
        
        //Stubbing
        if let route = try? AuthRouter.verifyEmail(resetToken).asURLRequest() {
            self.startStub(route, stubData: .verifyEmail )
        }
        
        //Call API
        Client.instance.auth.verifyEmail(resetToken) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
