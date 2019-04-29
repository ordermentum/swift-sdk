//
//  FlagsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte

@testable import OrdermentumSDK

class FlagsServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetFlags() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let flagsStr: String = self.getEnvironmentVar("FLAGS") ?? ""
        let flags: [String] = flagsStr.split(separator: ",").map({ (substring) in
            return String(substring)
        })
        
        let supplierIdStr: String = self.getEnvironmentVar("SUPPLIERID_ARR") ?? ""
        let supplierId: [String] = supplierIdStr.split(separator: ",").map({ (substring) in
            return String(substring)
        })
        
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let userId: String = self.getEnvironmentVar("USER_ID") ?? ""
        
        if let route = try? FlagsRouter.getFlags(flags, supplierId, retailerId, userId).asURLRequest() {
            print(route)
            let method = HTTPMethod(rawValue: self.getRouterMethod(url: route))!
            self.startStub(route, method: method, stubData: .getFlags)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.flags.getFlags(flagsArray: flags, supplierIdArray: supplierId, retailerId: retailerId, userId: userId) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertTrue(responseData?.findSupplier ?? true)
                XCTAssertTrue(responseData?.review ?? true)
                XCTAssertTrue(responseData?.dashboardProfile ?? true)
                XCTAssertTrue(responseData?.userInvite ?? true)
                XCTAssertTrue(responseData?.popularProducts ?? true)
                XCTAssertTrue(responseData?.addons ?? true)
                XCTAssertTrue(responseData?.homePopularProducts ?? true)
                XCTAssertTrue(responseData?.retailerSignup ?? true)
                XCTAssertTrue(responseData?.addVenue ?? true)
                XCTAssertTrue(responseData?.projectionsV2 ?? true)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
