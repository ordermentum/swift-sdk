//
//  AppVersionRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 26/7/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum AppVersionRouter: URLRequestConvertible {
    //Routes
    case checkVersion
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .checkVersion:
            return .get
        }
    }
    
    var version: String {
        switch self {
        default:
            return ""
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .checkVersion:
            return "ios/manifest.json"
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
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try StaticClient.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
