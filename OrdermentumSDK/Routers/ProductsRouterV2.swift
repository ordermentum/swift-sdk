//
//  ProductsRouterV2.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 11/30/20.
//

import Foundation
import Alamofire

public enum ProductsRouterV2: URLRequestConvertible {
    //Routes
    case getProducts(String, ProductSearchRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .post
        }
    }

    //Paths
    var path: String {
        switch self {
        case .getProducts(let retailerId, _):
            return "products/\(retailerId)/search"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .getProducts(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try ClientV2.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
