//
//  NPSServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class NPSServiceTests: XCTestCase {

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
    
    func testGetNPS() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Aysnc Test")
        
        //Call API
//        Client.instance.setTestingURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        NPSService().getNPS { (result, response) in
            assert(result)
            expectation.fulfill()
        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSendFeedback(){
        //Build Expectation
        let expectation = XCTestExpectation(description: "Aysnc Test")
        
        var requestObject: NPSFeedback = NPSFeedback()
        requestObject.score = 0
        requestObject.comment = ""
        
        //Call API
//        Client.instance.setTestingURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
//        NPSService().sendFeedbct: requestObject) { (result) in
//            assert(result)
//            expectation.fulfill()
//        }
        
        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
