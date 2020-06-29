//
//  FlagsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum FlagsRouter: URLRequestConvertible {
    //Routes
    case getFlags([String], [String], String, String, Bool)
    case getMarketplaceFlags([String], String, String, String, Bool)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getFlags:
            return .get
        case .getMarketplaceFlags:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getFlags:
            return "flags/check"
        case .getMarketplaceFlags:
            return "flags/check"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getFlags(let flagsArray, let supplierIdArray, let retailerId, let userId, let isRetailer):
            return ["flags": flagsArray,
                    "context[supplierId]": supplierIdArray,
                    "context[retailerId]": retailerId,
                    "context[userId]": userId,
                    "context[isRetailer]": isRetailer]
            
        case .getMarketplaceFlags(let flagsArray, let supplierId, let retailerId, let userId, let isRetailer):
            return ["flags": flagsArray,
                    "context[supplierId]": supplierId,
                    "context[retailerId]": retailerId,
                    "context[userId]": userId,
                    "context[isRetailer]": isRetailer]
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
        return try FlagsClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
