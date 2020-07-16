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

    func testGetNPS() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Aysnc Test")

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        //Stubbing
        if let route = try? NPSRouter.getNPS.asURLRequest() {
            self.startStub(route, stubData: .getNPS)
        }

        //Call API
        Client.instance.nps.getNPS { (result, response) in
            assert(result)
            XCTAssertNotNil(response)
            expectation.fulfill()
        }

        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testSendFeedback() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Aysnc Test")

        //Build request body and params
        var requestObject: NPSFeedback = NPSFeedback()
        if let scoreString = ProcessInfo.processInfo.environment["NPS_SCORE"], let score = Int(scoreString) {
            requestObject.score = score
        }
        requestObject.comment = ProcessInfo.processInfo.environment["NPS_COMMENT"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        //Stubbing
        if let route = try? NPSRouter.sendFeedback(requestObject).asURLRequest() {
            self.startStub(route, stubData: .sendFeedback)
        }

        //Call API
        Client.instance.nps.sendFeedback(requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }

        //Wait until the expectation is fullfiled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
