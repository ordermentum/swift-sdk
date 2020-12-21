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
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .hydrate:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .hydrate:
            return "cart"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .hydrate(let supplierId):
            return ["supplierId": supplierId]
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
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
