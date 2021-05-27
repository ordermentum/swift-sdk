//
//  InvoiceListRouter.swift
//  
//
//  Created by Brandon Stillitano on 27/5/21.
//

import Foundation
import Alamofire

public enum InvoiceListRouter: URLRequestConvertible {
    //Routes
    case getInvoices([String: Any])
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getInvoices:
            return .get
        }
    }
    
    var version: String {
        switch self {
        default:
            return "v1/"
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getInvoices:
            return "invoices"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getInvoices(let dictionary):
            return dictionary
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        default:
            return nil
        }
    }
    
    //Timeout
    var timeout: Int {
        switch self {
        default:
            return 10
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body, timeout: timeout)
    }
}
