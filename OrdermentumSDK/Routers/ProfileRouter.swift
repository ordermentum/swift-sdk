//
//  ProfileRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ProfileRouter: URLRequestConvertible {
    //Routes
    case getProfile
    case updateProfile(String, UpdateUserRequest)
    case updateVenuePositions(String, [String: [String]])

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getProfile:
            return .get
        case .updateProfile:
            return .patch
        case .updateVenuePositions:
            return .put
        }
    }

    //Paths
    var path: String {
        switch self {
        case .getProfile:
            return "profiles"
        case .updateProfile(let userId, _):
            return "users/\(userId)"
        case .updateVenuePositions(let userId, _):
            return "users/\(userId)/positions"
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
        case .updateProfile(_, let requestObject):
            return requestObject
        case .updateVenuePositions(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
