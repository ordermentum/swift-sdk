//
//  InvoiceServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 15/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import XCTest
@testable import OrdermentumSDK

class InvoiceServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSuppliers() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setProductionURL()
        InvoiceService().getSuppliers(retailerId: "", supplierId: "", sortBy: "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testExportInvoice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Disconnnect Request Object
        var requestObject: ExportRequest = ExportRequest()
        requestObject.name = ProcessInfo.processInfo.environment["EXPORT_NAME"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["EXPORT_RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["EXPORT_SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["EXPORT_TYPE"] ?? ""
        requestObject.socketId = ProcessInfo.processInfo.environment["EXPORT_SOCKET_ID"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        InvoiceService().exportInvoice(requestObject: requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testDownloadInvoice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Call API
        Client.instance.setProductionURL()
        InvoiceService().downloadInvoice(invoiceId: "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testApplyPayment() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build Disconnnect Request Object
        var requestObject: InvoicePaymentRequest = InvoicePaymentRequest()
        requestObject.paymentMethodId = ProcessInfo.processInfo.environment["INVOICE_PAYMENT_METHOD_ID"] ?? ""
        
        //Call API
        Client.instance.setProductionURL()
        InvoiceService().applyPayment(invoiceId: "", requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

}
