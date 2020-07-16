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

    func skipped_testGetInvoices() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build Request body and params
        let retailerId = ProcessInfo.processInfo.environment["RETAILER_ID"] ?? ""
        let supplierId = ProcessInfo.processInfo.environment["SUPPLIER_ID"] ?? ""
        let sortBy = ProcessInfo.processInfo.environment["SORT"] ?? "-1"

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

//        //Stubbing
//        if let route = try? InvoiceRouter.getInvoices(retailerId, supplierId, sortBy).asURLRequest() {
//            self.startStub(route, stubData: .getInvoices )
//        }
//
//        //Call API
//        Client.instance.invoices.getInvoices(retailerId: retailerId, supplierId: supplierId, sortBy: sortBy) { (result, responseData) in
//            assert(result)
//            expectation.fulfill()
//        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testExportInvoice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build ExportRequestData for ExportRequest Object
        var exportRequestData: ExportRequestData = ExportRequestData()
        var includedIds: [String] = []
        let includedIdsJSONString = ProcessInfo.processInfo.environment["EXPORT_REQUEST_DATA_INCLUDED_IDS"] ?? ""
        if !includedIdsJSONString.isEmpty {
            let includedIdsJSONData = includedIdsJSONString.data(using: .utf8) ?? Data()
            if let json = try? JSONSerialization.jsonObject(with: includedIdsJSONData), let array = json as? [String] {
                includedIds = array
            }
        }
        exportRequestData.includedIds = includedIds
        exportRequestData.all = (ProcessInfo.processInfo.environment["EXPORT_REQUEST_DATA_ALL"] ?? "").toBool()
        exportRequestData.searchQuery = ProcessInfo.processInfo.environment["EXPORT_REQUEST_DATA_SEARCH_QUERY"] ?? ""

        //Build ExportRequest Request Object
        var requestObject: ExportRequest = ExportRequest()
        requestObject.data = exportRequestData
        requestObject.name = ProcessInfo.processInfo.environment["EXPORT_NAME"] ?? ""
        requestObject.retailerId = ProcessInfo.processInfo.environment["EXPORT_RETAILER_ID"] ?? ""
        requestObject.supplierId = ProcessInfo.processInfo.environment["EXPORT_SUPPLIER_ID"] ?? ""
        requestObject.type = ProcessInfo.processInfo.environment["EXPORT_TYPE"] ?? ""
        requestObject.socketId = ProcessInfo.processInfo.environment["EXPORT_SOCKET_ID"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        //Stubbing
        if let route = try? InvoiceRouter.exportInvoice(requestObject).asURLRequest() {
            self.startStub(route, stubData: .exportInvoice)
        }

        //Call API
        Client.instance.invoices.exportInvoice(requestObject) { (result, _) in
            assert(result)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testDownloadInvoice() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build Request body and params
        let invoiceId = ProcessInfo.processInfo.environment["INVOICE_ID"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        //Stubbing
        if let route = try? InvoiceRouter.downloadInvoice(invoiceId).asURLRequest() {
            self.startStub(route, stubData: .downloadInvoice)
        }

        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.invoices.downloadInvoice(invoiceId: invoiceId) { (result, _) in
            assert(result)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testApplyPayment() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")

        //Build InvoicePaymentRequest Request Object
        let invoiceId = ProcessInfo.processInfo.environment["INVOICE_ID"] ?? ""
        var requestObject: InvoicePaymentRequest = InvoicePaymentRequest()
        requestObject.paymentMethodId = ProcessInfo.processInfo.environment["INVOICE_PAYMENT_METHOD_ID"] ?? ""

        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        //Stubbing
        if let route = try? InvoiceRouter.applyPayment(invoiceId, _).asURLRequest() {
            self.startStub(route, stubData: .applyPayment)
        }

        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.invoices.applyPayment(invoiceId: invoiceId, requestObject: requestObject) { (result) in
            assert(result)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
