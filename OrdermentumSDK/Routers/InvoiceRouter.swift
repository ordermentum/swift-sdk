//
//  InvoiceRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum InvoiceRouter: URLRequestConvertible {
    //Routes
    case getInvoices(String, String, String, String, Int)
    case getInvoice(String)
    case exportInvoice(ExportRequest)
    case downloadInvoice(String)
    case applyPayment(String, InvoicePaymentRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getInvoices:
            return .get
        case .getInvoice:
            return .get
        case .exportInvoice:
            return .post
        case .downloadInvoice:
            return .get
        case .applyPayment:
            return .put
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getInvoices:
            return "invoices"
        case .getInvoice(let invoiceId):
            return "invoices/\(invoiceId)"
        case .exportInvoice:
            return "exports"
        case .downloadInvoice(let invoiceId):
            return "exports/\(invoiceId)"
        case .applyPayment(let invoiceId, _):
            return "invoices/\(invoiceId)/pay"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getInvoices(let retailerId, let supplierId, let sortBy, let sortOrder, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "sortBy[\(sortBy)]": sortOrder, "pageNo": pageNo]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .exportInvoice(let requestObject):
            return requestObject
        case .applyPayment(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Timeout
    var timeout: Int {
        switch self {
        case .applyPayment:
            return 120
        default:
            return 10
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body, timeout: timeout)
    }
}
