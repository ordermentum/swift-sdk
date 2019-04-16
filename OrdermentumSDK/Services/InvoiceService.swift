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
    /**
     * Get the invoices belonging to a retailer/supplier relationship
     * Returns a InvoiceResponse
     */
    func getSuppliers(retailerId: String, supplierId: String, sortBy: String, completion: @escaping (Bool, InvoiceResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.getInvoices(retailerId, supplierId, sortBy) as URLRequestConvertible
        
        //Call API
        Service<InvoiceResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Sends a request to export an invoice
     * Returns an ExportResponse
     */
    func exportInvoice(requestObject: ExportRequest, completion: @escaping (Bool, ExportResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.exportInvoice(requestObject) as URLRequestConvertible
        
        //Call API
        Service<ExportResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Download an invoice PDF file
     * Returns an ExportResponse
     */
    func downloadInvoice(invoiceId: String, completion: @escaping (Bool, ExportResponse?) -> ()) {
        //Build Route
        let route = InvoiceRouter.downloadInvoice(invoiceId) as URLRequestConvertible
        
        //Call API
        Service<ExportResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Make payment on an invoice, used for 'Click to Pay'
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    func applyPayment(invoiceId: String, requestObject: InvoicePaymentRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = InvoiceRouter.applyPayment(invoiceId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
