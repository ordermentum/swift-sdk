//
//  ProductsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
import Hippolyte

@testable import OrdermentumSDK

class ProductsServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetProductCategories() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 1
        let pageNo: Int = Int(self.getEnvironmentVar("PAGE_NO")!) ?? 10
        
        if let route = try? ProductsRouter.getProductCategories(retailerId, supplierId, pageSize, pageNo).asURLRequest() {
            self.startStub(route, stubData: .getProductCategories)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.getProductCategories(retailerId: retailerId, supplierId: supplierId, pageSize: pageSize, pageNo: pageNo) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetProduct() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let categoryId: String = self.getEnvironmentVar("CATEGORY_ID") ?? ""
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let visible : Bool = Bool(self.getEnvironmentVar("VISIBLE")!) ?? true
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 1
        let pageNo: Int = Int(self.getEnvironmentVar("PAGE_NO")!) ?? 10
        
        if let route = try? ProductsRouter.getProducts(categoryId, retailerId, supplierId, visible, pageSize, pageNo).asURLRequest() {
            self.startStub(route, stubData: .getProduct)
        }

        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.getProducts(categoryId: categoryId, retailerId: retailerId, supplierId: supplierId, visible: visible, pageSize: pageSize, pageNo: pageNo) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetMostOrderedProducts() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let visible : Bool = Bool(self.getEnvironmentVar("VISIBLE")!) ?? true
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 0
        let pageNo: Int = Int(self.getEnvironmentVar("PAGE_NO")!) ?? 0
        
        if let route = try? ProductsRouter.getMostOrderedProducts(retailerId, supplierId, visible, pageSize, pageNo).asURLRequest() {
            self.startStub(route, stubData: .getMostOrderedProducts)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.getMostOrderedProducts(retailerId: retailerId, supplierId: supplierId, visible: visible, pageSize: pageSize, pageNo: pageNo) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetTrendingProducts() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let visible : Bool = Bool(self.getEnvironmentVar("VISIBLE")!) ?? true
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 0
        let pageNo: Int = Int(self.getEnvironmentVar("PAGE_NO")!) ?? 0
        
        if let route = try? ProductsRouter.getTrendingProducts(retailerId, supplierId, visible, pageSize, pageNo).asURLRequest() {
            self.startStub(route, stubData: .getTrendingProducts)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.getTrendingProducts(retailerId: retailerId, supplierId: supplierId, visible: visible, pageSize: pageSize, pageNo: pageNo) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetRecommendedProducts() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let retailerId: String = self.getEnvironmentVar("RETAILER_ID") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 0
        let excludedProductIdStr: String = self.getEnvironmentVar("EXCLUDED_PRODID") ?? ""

        let excludedProductId: [String] = excludedProductIdStr.split(separator: ",").map({ (substring) in
            return String(substring)
        })

        if let route = try? ProductsRouter.getRecommendedProducts(retailerId, supplierId, pageSize, excludedProductId).asURLRequest() {
            self.startStub(route, stubData: .getRecommendedProducts)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.getRecommendedProducts(retailerId: retailerId, supplierId: supplierId, pageSize: pageSize, excludedProductIdsArray: excludedProductId) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSearchProducts() {
        Client.instance.baseURL = ClientURL.rootTestingURL
        let search: String = self.getEnvironmentVar("SEARCH") ?? ""
        let supplierId: String = self.getEnvironmentVar("SUPPLIER_ID") ?? ""
        let visible: Bool = Bool(self.getEnvironmentVar("VISIBLE")!) ?? true
        let pageSize: Int = Int(self.getEnvironmentVar("PAGE_SIZE")!) ?? 0

        if let route = try? ProductsRouter.searchProducts(search, supplierId, visible, pageSize).asURLRequest() {
            self.startStub(route, stubData: .searchProducts)
        }
        
        //Build Expectation
        let expectation = XCTestExpectation(description: "Stubs network call")
        
        Client.instance.products.searchProducts(search: search, supplierId: supplierId, visible: visible, pageSize: pageSize) { (result, responseData) in
            if result {
                assert(result)
                expectation.fulfill()
                XCTAssertFalse((responseData?.data.isEmpty)!)
            }
            else {
                XCTFail("Expected JSON Response to succeed, but failed")
            }
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
