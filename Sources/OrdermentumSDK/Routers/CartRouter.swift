//
//  CartRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 21/12/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum CartRouter: URLRequestConvertible {
    //Routes
    case hydrate(String)
    case populateCart(CartActionRequest)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .hydrate:
            return .get
        case .populateCart:
            return .patch
        }
    }

    //Auth
    var requiresAuthorization: Bool {
        switch self {
        default:
            return true
        }
    }

    //Base URL
    var baseURL: String {
        return OM.instance.endpoints.cart
    }

    //Versions
    var version: String {
        switch self {
        default:
            return "v1/"
        }
    }

    //Paths
    var path: String {
        switch self {
        case .hydrate(let cartId):
            return "cart/\(cartId)"
        case .populateCart:
            return "cart"
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
        case .populateCart(let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Content-Type
    var contentType: ContentType {
        switch self {
        default:
            return .json
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
        return try OM.instance.urlRequest(baseURL: baseURL,
                                          path: version + (path ?? ""),
                                          method: method,
                                          parameters: parameters,
                                          body: body,
                                          contentType: contentType,
                                          timeout: timeout,
                                          requiresAuthorization: requiresAuthorization)
    }
}
