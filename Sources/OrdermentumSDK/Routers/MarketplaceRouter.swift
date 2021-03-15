//
//  MarketplaceRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum MarketplaceRouter: URLRequestConvertible {
    //Routes
    case getMarketplaces(String, Int, Int)
    case getSupplier(String)
    case getRecommendedSupplier(String)
    case getPendingSuppliers(String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getMarketplaces:
            return .get
        case .getSupplier:
            return .get
        case .getRecommendedSupplier:
            return .get
        case .getPendingSuppliers:
            return .get
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
        case .getMarketplaces:
            return "marketplaces"
        case .getSupplier(let supplierId):
            return "suppliers/\(supplierId)"
        case .getRecommendedSupplier(let supplierId):
            return "suppliers/directory/\(supplierId)"
        case .getPendingSuppliers:
            return "connection-requests"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getMarketplaces(let retailerId, let pageSize, let pageNo):
            return ["retailerId": retailerId, "pageSize": pageSize, "pageNo": pageNo]
        case .getPendingSuppliers(let retailerId):
            return ["retailerId": retailerId]
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
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
