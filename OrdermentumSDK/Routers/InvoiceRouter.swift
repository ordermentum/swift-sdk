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
    case getInvoices([String: Any])
    case getInvoice(String)
    case exportInvoice(ExportRequest)
    case getInvoiceExport(String)
    case getExportDownload(String)
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
        case .getInvoiceExport:
            return .get
        case .getExportDownload:
            return .get
        case .applyPayment:
            return .put
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
        case .getInvoice(let invoiceId):
            return "invoices/\(invoiceId)"
        case .exportInvoice:
            return "exports"
        case .getInvoiceExport(let invoiceId):
            return "exports/\(invoiceId)"
        case .getExportDownload(let invoiceId):
            return "exports/\(invoiceId)/download"
        case .applyPayment(let invoiceId, _):
            return "invoices/\(invoiceId)/pay"
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
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body, timeout: timeout)
    }
}
