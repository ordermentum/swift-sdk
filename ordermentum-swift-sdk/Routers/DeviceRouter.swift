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
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        //Setup Data
        let url = try Client.instance.baseURL.asURL()
        let timeoutSeconds: Int = 10
        
        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Client.instance.getHeaderToken(), forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        
        //Set Conditional Body
        if body != nil {
            request.httpBody = body?.toJSONData()
        }
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
