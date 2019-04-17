//
//  CreateProfileRouter.swift
//  OrdermentumSDK
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum CreateProfileRouter: URLRequestConvertible {
    //Routes
    case createProfile(CreateUserProfile)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .createProfile:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .createProfile:
            return "profile"
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
        case .createProfile(let requestObject):
            return requestObject
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
