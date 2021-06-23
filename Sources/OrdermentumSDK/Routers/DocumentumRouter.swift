//
//  DocumentumRouter.swift
//
//
//  Created by Brandon Stillitano on 27/5/21.
//

import Foundation
import Alamofire

public enum DocumentumRouter: URLRequestConvertible {
    //Routes
    case getInvoices([String: Any])
    case getExternalInvoice(String)
    case updateExternalInvoice(String, ExternalInvoiceUpdateRequest)
    case createInvoice(CreateInvoiceRequest)
    case uploadFile(String, Data)
    case getExternalSuppliers(Int, Int, String, [String]?, String)
    case createExternalSupplier(CreateExternalSupplierRequest)
    case markExternalInvoiceAsPaid(String, UpdateExternalInvoicePaymentRequest)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getInvoices:
            return .get
        case .getExternalInvoice:
            return .get
        case .createInvoice:
            return .post
        case .updateExternalInvoice:
            return .put
        case .uploadFile:
            return .put
        case .getExternalSuppliers:
            return .get
        case .createExternalSupplier:
            return .post
        case .markExternalInvoiceAsPaid:
            return .put
        }
    }

    //Auth
    var requiresAuthorization: Bool {
        switch self {
        case .uploadFile:
            return false
        default:
            return true
        }
    }

    //Signed URL
    var signedURL: String? {
        switch self {
        case .uploadFile(let url, _):
            return url
        default:
            return nil
        }
    }

    //Base URL
    var baseURL: String {
        return OM.instance.endpoints.documentum
    }

    //Version
    var version: String {
        switch self {
        case .uploadFile:
            return ""
        default:
            return "v1/"
        }
    }

    //Paths
    var path: String? {
        switch self {
        case .getInvoices:
            return "invoices"
        case .getExternalInvoice(let id):
            return "external_invoices/\(id)"
        case .createInvoice:
            return "external_invoices"
        case .updateExternalInvoice(let id, _):
            return "external_invoices/\(id)"
        case .uploadFile:
            return nil
        case .getExternalSuppliers:
            return "external_suppliers"
        case .createExternalSupplier:
            return "external_suppliers"
        case .markExternalInvoiceAsPaid(let id, _):
            return "external_invoices/\(id)"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getInvoices(let dictionary):
            return dictionary
        case .getExternalSuppliers(let pageNo, let pageSize, let retailerId, let supplierId, let name):
            return ["pageNo": pageNo, "pageSize": pageSize, "retailerId": retailerId, "supplierId": supplierId ?? [], "name": name]
        default:
            return [:]
        }
    }

    //Content-Type
    var contentType: ContentType {
        switch self {
        case .uploadFile:
            return .pdf
        default:
            return .json
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .createInvoice(let requestObject):
            return requestObject
        case .updateExternalInvoice(_, let requestObject):
            return requestObject
        case .uploadFile(_, let data):
            return data
        case .createExternalSupplier(let requestObject):
            return requestObject
        case .markExternalInvoiceAsPaid(_, let requestObject):
            return requestObject
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
        let optionalPath: String? = signedURL == nil ? version + (path ?? "") : nil
        return try OM.instance.urlRequest(baseURL: signedURL ?? baseURL,
                                          path: optionalPath,
                                          method: method,
                                          parameters: parameters,
                                          body: body,
                                          contentType: contentType,
                                          timeout: timeout,
                                          requiresAuthorization: requiresAuthorization)
    }
}
