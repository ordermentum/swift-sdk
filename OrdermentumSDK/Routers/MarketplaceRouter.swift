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
    case getPendingSupplier(String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getMarketplaces:
            return .get
        case .getSupplier:
            return .get
        case .getRecommendedSupplier:
            return .get
        case .getPendingSupplier:
            return .get
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
        case .getPendingSupplier:
            return "connection-requests"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getMarketplaces(let retailerId, let pageSize, let pageNo):
            return ["retailerId": retailerId, "pageSize": pageSize, "pageNo": pageNo]
        case .getPendingSupplier(let retailerId):
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
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
