//
//  DocumentumService.swift
//  
//
//  Created by Brandon Stillitano on 27/5/21.
//

import Foundation
import Alamofire

public enum DocumentumService {
    /// Get invoices based on arbitrary key/value pairs
    /// - Parameters:
    ///   - params: Dictionary of `[String: Any]` values that can be used to filter invoices
    ///   - completion: Completion block containing the invoice response data
    public static func getInvoices(params: [String: Any], completion: @escaping (Bool, InvoiceListResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = DocumentumRouter.getInvoices(params) as URLRequestConvertible
        
        //Call API
        Service<InvoiceListResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    public static func createInvoice(request: CreateInvoiceRequest, completion: @escaping (Bool, CreateInvoiceResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = DocumentumRouter.createInvoice(request) as URLRequestConvertible
        
        //Call API
        Service<CreateInvoiceResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    public static func uploadFile(url: String, data: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = DocumentumRouter.uploadFile(url, data) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
