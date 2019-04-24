//
//  MarketplaceServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte
@testable import OrdermentumSDK

class MarketplaceServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMarketPlaces() {
        //Setup Request and Start Stub
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId:String = self.getEnvironmentStrVar("RETAILER_ID") ?? ""
        let pageSize:Int = self.getEnvironmentIntVar("PAGE_SIZE") ?? 0
        let pageNo:Int = self.getEnvironmentIntVar("PAGE_NO") ?? 0
        
        //Start Stub
        if let route = try? MarketplaceRouter.getMarketplaces(retailerId, pageSize, pageNo).asURLRequest() {
            self.startStub(route, stubData: .getMarketPlaces)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.marketplaces.getMarketplaces(retailerId: retailerId, pageSize: pageSize, pageNo: pageNo) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
            }
            else {
               XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
         //Wait until the expectation is fulfilled, with a timeout of 10 seconds.
         wait(for: [expectation], timeout: 10.0)
    }
}


