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
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
