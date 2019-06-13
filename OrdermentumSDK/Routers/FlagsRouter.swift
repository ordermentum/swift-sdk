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
    case getFlags([String], [String], String, String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getFlags:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getFlags:
            return "flags/check"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getFlags(let flagsArray, let supplierIdArray, let retailerId, let userId):
            return ["flags[]": flagsArray, "supplierId[]": supplierIdArray, "context[retailerId]": retailerId, "context[userId]": userId]
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
        return try FlagsClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
