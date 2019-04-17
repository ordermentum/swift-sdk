//
//  ProductsServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class ProductsServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetProductCategories() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: CategoryResponse = CategoryResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().getProductCategories(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetProduct() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ProductResponse = ProductResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().getProducts(categoryId: ProcessInfo.processInfo.environment["CATEGORY_ID"] ?? "", retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", visible: true, pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetMostOrderedProducts() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ProductResponse = ProductResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().getMostOrderedProducts(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", visible: true, pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetTrendingProducts() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ProductResponse = ProductResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().getTrendingProducts(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", visible: true, pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetRecommendedProducts() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ProductResponse = ProductResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().getRecommendedProducts(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", pageSize: 10, excludedProductIdsArray: []) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testSearchProducts() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: ProductResponse = ProductResponse()
        requestObject.meta = Meta()
        requestObject.links = Links()
        requestObject.data = []
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        ProductsService().searchProducts(search: ProcessInfo.processInfo.environment["SEARCH_STRING"] ?? "", supplierId: ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? "", visible: true, pageSize: 10) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
}
