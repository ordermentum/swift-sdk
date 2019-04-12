////
////  ProjectionsServiceTests.swift
////  ordermentum-swift-sdkTests
////
////  Created by Brandon Stillitano on 10/4/19.
////  Copyright © 2019 Ordermentum. All rights reserved.
////
//
//import Foundation
//import XCTest
//@testable import ordermentum_swift_sdk
//
//class ProjectionsServiceTest: XCTestCase {
//    
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//    
//    func testCancelOrder() {
//        //Build Expectation
//        let expectation = XCTestExpectation(description: "Async Test")
//        
//        //Call API
//        Client.instance.setProductionURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
//        ProjectionsService().cancelOrder(purchaserScheduleId: <#T##String#>, date: <#T##String#>) { (result) in
//            assert(result)
//            expectation.fulfill()
//        }
//        
//        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testDeleteOrder() {
//        //Build Expectation
//        let expectation = XCTestExpectation(description: "Async Test")
//        
//        //Call API
//        Client.instance.setProductionURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
//        ProjectionsService().deleteOrder(purchaserScheduleId: <#T##String#>, requestObject: <#T##ProjectionDeleteRequest#>) { (result) in
//            assert(result)
//            expectation.fulfill()
//        }
//        
//        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetOrders() {
//        //Build Expectation
//        let expectation = XCTestExpectation(description: "Async Test")
//        
//        //Call API
//        Client.instance.setProductionURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
//        ProjectionsService().getOrder(orderId: <#T##String#>) { (result, responseData) in
//            assert(result)
//            expectation.fulfill()
//        }
//        
//        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetProjections() {
//        //Build Expectation
//        let expectation = XCTestExpectation(description: "Async Test")
//        
//        //Call API
//        Client.instance.setProductionURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
//        ProjectionsService().getProjections(purchaserId: <#T##String#>, startDate: <#T##String#>, timezone: <#T##String#>) { (result, responseData) in
//            assert(result)
//            expectation.fulfill()
//        }
//        
//        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testReinstateOrder() {
//        //Build Expectation
//        let expectation = XCTestExpectation(description: "Async Test")
//        
//        //Call API
//        Client.instance.setProductionURL()
//        Client.instance.setToken(tokenString: ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? "")
//        ProjectionsService().reinstateOrder(purchaserScheduleId: <#T##String#>, requestObject: <#T##ProjectionReinstateRequest#>) { (result) in
//            assert(result)
//            expectation.fulfill()
//        }
//        
//        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
//        wait(for: [expectation], timeout: 10.0)
//    }
//}
