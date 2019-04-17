//
//  ValidationServiceTest.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte
import Alamofire
@testable import OrdermentumSDK

class ValidationServiceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidateItems() {
        //Call API
        Client.instance.setTestingURL()
        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
        
        var sampData = [ValidationData]()
        
        sampData = loadJson(filename: "TestData")!
        
        print(sampData[0].deliveryDate)
        
        let getData: [String: Any] = [
            "deliveryDate": "",
            "lineItems": [],
            "retailerId": "5cc8f78c-9696-4d64-aa29-5c592524915f",
            "supplierId": "9b9cf5b6-0d06-436e-83c1-52d25e642e40",
            "type": ""
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: getData)
        
        let path = ValidationRouter.validateItems(ValidationRequestBody.init()).path

        let url = URL(string: Client.instance.baseURL + path)!
        var stub = StubRequest(method: .POST, url: url)
        var response = StubResponse()
        let body = jsonData
        response.body = body
        stub.response = response
        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ValidationRequestBody = ValidationRequestBody()
        requestObject.deliveryDate = ProcessInfo.processInfo.environment["DELIVERY_DATE"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["TYPE"] ?? ""
        requestObject.lineItems = []

        ValidationService().validateItems(requestObject: requestObject) { (result, responseData) in
            print("RESULT: ", result)
            assert(result)
            expectation.fulfill()
        }
    }
}
