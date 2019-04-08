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
    case getInvoices(String, String, String)
    case exportInvoice(ExportRequest)
    case downloadInvoice(String)
    case applyPayment(String, InvoicePaymentRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getInvoices:
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
        case .getInvoices(let supplierId, let retailerId, let sortBy):
            return ["supplierId": supplierId, "retailerId": retailerId, "sortBy[createdAt]": sortBy]
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
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
