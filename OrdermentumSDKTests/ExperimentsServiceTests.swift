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
        
        //Build Request body and params
        let slot = ProcessInfo.processInfo.environment["EXPERIMENT_SLOT"] ?? ""
        let source = ProcessInfo.processInfo.environment["EXPERIMENT_SOURCE"] ?? ""
        let version = ProcessInfo.processInfo.environment["EXPERIMENT_VERSION"] ?? ""
        let retailerId = ProcessInfo.processInfo.environment["EXPERIMENT_RETAILERID"] ?? ""
        let isRetailer = false
        let userId = ProcessInfo.processInfo.environment["EXPERIMENT_USERID"] ?? ""
        let purchaserId = ProcessInfo.processInfo.environment["EXPERIMENT_PURCHASERID"] ?? ""
        let supplierIds: [String] = []
        
        //Request setup
        FlagsClient.instance.baseURL = FlagsClientURL.rootFlagsTestingURL
        FlagsClient.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? ExperimentsRouter.getExperiments(slot, source, version, retailerId, isRetailer, userId, purchaserId, supplierIds, "").asURLRequest() {
            self.startStub(route, stubData: .getExperiments )
        }
        
        //Call API
        
        FlagsClient.instance.experiments.getExperiments(slot: slot, source: source, version: version, retailerId: retailerId, isRetailer: false, userId: userId, purchaserId: purchaserId, supplierIds: [], model: "") { (result, responseData, err) in
            assert(result)
            XCTAssertNotNil(responseData)
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
        FlagsClient.instance.baseURL = FlagsClientURL.rootFlagsTestingURL
        FlagsClient.instance.experiments.dismissExperiment(requestObject) { (result, err) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
