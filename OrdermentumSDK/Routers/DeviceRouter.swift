//
//  DeviceRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum DeviceRouter: URLRequestConvertible {
    //Routes
    case registerDevice(Device)
    case unregisterDevice(Device)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .registerDevice:
            return .post
        case .unregisterDevice:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .registerDevice:
            return "user_devices"
        case .unregisterDevice:
            return "uninstall"
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
        case .unregisterDevice(let requestObject):
            return requestObject
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
