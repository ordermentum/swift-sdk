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
    case createInvoice(CreateInvoiceRequest)
    case uploadFile(String, Data)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getInvoices:
            return .get
        case .createInvoice:
            return .post
        case .uploadFile:
            return .put
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
    var path: String {
        switch self {
        case .getInvoices:
            return "invoices"
        case .createInvoice:
            return "external_invoices"
        case .uploadFile:
            return ""
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
        case .uploadFile(_, let data):
            return data.base64EncodedString()
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
        let optionalPath: String? = signedURL == nil ? version + path : nil
        return try OM.instance.urlRequest(baseURL: signedURL ?? baseURL, path: optionalPath, method: method, parameters: parameters, body: body, contentType: contentType, timeout: timeout)
    }
}
