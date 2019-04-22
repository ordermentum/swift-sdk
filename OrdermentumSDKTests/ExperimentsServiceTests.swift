//
//  ExperimentsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class ExperimentsServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetExperiments() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.experiments.getExperiments(slot: "", source: "", version: "", retailerId: "", isRetailer: false, userId: "", supplierIds: []) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDismissExperiment() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build ExperimentsDismissRequest Request Object
        var requestObject: ExperimentsDismissRequest = ExperimentsDismissRequest()
        requestObject.userId = ProcessInfo.processInfo.environment["EPERIMENT_DISMISS_USER_ID"] ?? ""
        requestObject.experimentId = ProcessInfo.processInfo.environment["EPERIMENT_DISMISS_ID"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.experiments.dismissExperiment(requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}