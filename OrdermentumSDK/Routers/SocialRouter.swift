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

    //Methods
    var method: HTTPMethod {
        switch self {
        case .upgradeGoogleToken:
            return .post
        }
    }

    //Paths
    var path: String {
        switch self {
        case .upgradeGoogleToken:
            return "social/google/upgrade"
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
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try AuthClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}


