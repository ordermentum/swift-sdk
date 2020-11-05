//
//  ProfileRouterV2.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 11/3/20.
//

import Foundation
import Alamofire

public enum ProfileRouterV2: URLRequestConvertible {
    //Routes
    case checkProfile(String, String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .checkProfile:
            return .get
        }
    }

    //Paths
    var path: String {
        switch self {
        case .checkProfile(let code, _):
            return "profiles/check/\(code)"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .checkProfile(_, let id):
            return ["supplierId": id]
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
        return try ClientV2.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
