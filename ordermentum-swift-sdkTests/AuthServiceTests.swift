//
//  AuthServiceTests.swift
//  ordermentum-swift-sdkTests
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import ordermentum_swift_sdk

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
        loginRequest.username = "username"
        loginRequest.password = "password"
        
        //Call API
        Client.instance.setProductionURL()
        AuthService().login(requestObject: loginRequest) { (result, loginObject) in
            XCTAssertNotNil(loginObject?.access_token)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
