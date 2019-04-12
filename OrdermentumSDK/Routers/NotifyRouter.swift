//
//  NotifyRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum NotifyRouter: URLRequestConvertible {
    //Routes
    case registerDevice(NotifyBody)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .registerDevice:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .registerDevice:
            return "user_devices"
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
        case .registerDevice(let requestObject):
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
