//
//  InvoiceService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class InvoiceService {
    public init() {}
    
    /**
     * Get the invoices belonging to a retailer/supplier relationship
     * Returns a InvoiceResponse
     */
    public func getInvoices(retailerId: String, supplierId: String, sortBy: String, sortOrder: String, pageNo: Int, completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> ()) {
        //Build Params
        let params: [String: Any] = ["retailerId": retailerId, "supplierId": supplierId, "sortBy[\(sortBy)]": sortOrder, "pageNo": pageNo]
        
        //Build Route
        let route = InvoiceRouter.getInvoices(params) as URLRequestConvertible
        
        //Call API
        Service<InvoiceResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get all the invoices available to the current logged in user.
     * Returns an InvoiceResponse
     */
    public func getInvoices(pageNo: Int, filterName: String?, filterValue: String?, completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> ()) {
        //Build Params
        var params: [String: Any] = ["pageNo": pageNo]
        if let dateFilter: String = filterName {
            params[dateFilter] = filterValue
        }
        
        //Build Route
        let route = InvoiceRouter.getInvoices(params) as URLRequestConvertible
        
        //Call API
        Service<InvoiceResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get the invoice referenced by the invoiceID
     * Returns an Invoice
     */
    public func getInvoice(invoiceId: String, completion: @escaping (Bool, Invoice?, ErrorResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.getInvoice(invoiceId) as URLRequestConvertible
        
        //Call API
        Service<Invoice, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Sends a request to export an invoice
     * Returns an ExportResponse
     */
    public func exportInvoice(_ requestObject: ExportRequest, completion: @escaping (Bool, ExportResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.exportInvoice(requestObject) as URLRequestConvertible
        
        //Call API
        Service<ExportResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Download an invoice PDF file
     * Returns an ExportResponse
     */
    public func getInvoiceExport(invoiceId: String, completion: @escaping (Bool, ExportResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.getInvoiceExport(invoiceId) as URLRequestConvertible
        
        //Call API
        Service<ExportResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get the linki to download an invoice PDF file
     * Returns an ExportResponse
     */
    public func getExportDownload(invoiceId: String, completion: @escaping (Bool, ExportDownloadResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.getExportDownload(invoiceId) as URLRequestConvertible
        
        //Call API
        Service<ExportDownloadResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Make payment on an invoice, used for 'Click to Pay'
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func applyPayment(invoiceId: String, requestObject: InvoicePaymentRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.applyPayment(invoiceId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
