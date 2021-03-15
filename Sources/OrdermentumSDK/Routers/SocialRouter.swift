//
//  SocialRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 29/6/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum SocialRouter: URLRequestConvertible {
    //Routes
    case upgradeGoogleToken(TokenUpgradeRequest)
    case upgradeAppleToken(TokenUpgradeRequest)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .upgradeGoogleToken:
            return .post
        case .upgradeAppleToken:
            return .post
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
        case .upgradeGoogleToken:
            return "social/google/upgrade"
        case .upgradeAppleToken:
            return "social/apple/upgrade"
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
        case .upgradeGoogleToken(let requestObject):
            return requestObject
        case .upgradeAppleToken(let requestObject):
            return requestObject
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try AuthClient.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
