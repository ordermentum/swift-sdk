//
//  DocumentumService.swift
//  
//
//  Created by Brandon Stillitano on 27/5/21.
//

import Foundation
import Alamofire

public class DocumentumService {
    public init() { }
    
    /// Get invoices based on arbitrary key/value pairs
    /// - Parameters:
    ///   - params: Dictionary of `[String: Any]` values that can be used to filter invoices
    ///   - completion: Completion block containing the invoice response data
    public func getInvoices(params: [String: Any], completion: @escaping (Bool, InvoiceListResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = InvoiceListRouter.getInvoices(params) as URLRequestConvertible
        
        //Call API
        Service<InvoiceListResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
