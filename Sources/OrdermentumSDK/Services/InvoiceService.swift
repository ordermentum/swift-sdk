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
    public func getInvoices(retailerId: String, supplierId: String, sortBy: String, sortOrder: String, pageNo: Int, completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> Void) {
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
     * Get the invoices belonging to a retailer
     * Returns a InvoiceResponse
     */
    public func getInvoices(retailerId: String, sortBy: String?, sortOrder: String?, pageNo: Int, pageSize: Int, completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> Void) {
        //Build Params
        var params: [String: Any] = [:]
        params["retailerId"] = retailerId
        params["pageNo"] = pageNo
        params["pageSize"] = pageSize
        if let sortByKey: String = sortBy, let sortByValue: String = sortOrder {
            params["sortBy[\(sortByKey)]"] = sortByValue
        }
        
        //Build Route
        let route = InvoiceRouter.getInvoices(params) as URLRequestConvertible
        
        //Call API
        Service<InvoiceResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get invoices based on arbitrary key values
     * Returns a InvoiceResponse
     */
    public func getInvoices(params: [String: Any], completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> Void) {
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
    public func getInvoices(pageNo: Int, filterName: String?, filterValue: String?, completion: @escaping (Bool, InvoiceResponse?, ErrorResponse?) -> Void) {
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
    public func getInvoice(invoiceId: String, completion: @escaping (Bool, Invoice?, ErrorResponse?) -> Void) {
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
    public func exportInvoice(_ requestObject: ExportRequest, completion: @escaping (Bool, ExportResponse?, ErrorResponse?) -> Void) {
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
    public func getInvoiceExport(invoiceId: String, completion: @escaping (Bool, ExportResponse?, ErrorResponse?) -> Void) {
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
    public func getExportDownload(invoiceId: String, completion: @escaping (Bool, ExportDownloadResponse?, ErrorResponse?) -> Void) {
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
    public func applyPayment(invoiceId: String, requestObject: InvoicePaymentRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = InvoiceRouter.applyPayment(invoiceId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Retrieves the 50 most recent activity events on an invoice.
     * Returns an ActivityResponse object.
     */
    public func getActivity(supplierId: String, invoiceId: String, sortBy: String = "-1", completion: @escaping (Bool, ActivityResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = InvoiceRouter.getActivity(supplierId, invoiceId, sortBy) as URLRequestConvertible

        //Call API
        Service<ActivityResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    public func requestPayment(invoiceId: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = InvoiceRouter.requestPayment(invoiceId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /// Allows a retailer to mark an invoice as paid or unpaid. This does not necessarily mean that an invoice is in fact paid.
    /// - Parameters:
    ///   - invoiceId: The invoice that is being marked for payment
    ///   - paid: Whether the invoice is to marked as paid or unpaid
    ///   - completion: Async completion handler notifying that the request has completed. Contains success, data and error objects.
    public func markAsPaid(invoiceId: String, paid: Bool, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = InvoiceRouter.markAsPaid(invoiceId, paid) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
