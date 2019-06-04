//
//  RecommendedSuppliersRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 4/6/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum RecommendedSuppliersRouter: URLRequestConvertible {
    //Routes
    case getRecommendedSuppliers(String)
    case getTopRecommendedSuppliers(String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getRecommendedSuppliers:
            return .get
        case .getTopRecommendedSuppliers:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getRecommendedSuppliers:
            return "recommended-suppliers"
        case .getTopRecommendedSuppliers:
            return "top-recommended-suppliers"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getRecommendedSuppliers(let retailerId):
            return ["retailerId": retailerId]
        case .getTopRecommendedSuppliers(let retailerId):
            return ["retailerId": retailerId]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .getRecommendedSuppliers:
            return nil
        case .getTopRecommendedSuppliers:
            return nil
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}

