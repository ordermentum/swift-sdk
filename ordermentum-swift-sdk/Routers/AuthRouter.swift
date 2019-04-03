//
//  AuthRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum AuthRouter: URLRequestConvertible {
    //Routes
    case content
    case tags(String)
    case colors(String)
    
    // 3
    var method: HTTPMethod {
        switch self {
        case .content:
            return .post
        case .tags, .colors:
            return .get
        }
    }
    
    // 4
    var path: String {
        switch self {
        case .content:
            return "/content"
        case .tags:
            return "/tagging"
        case .colors:
            return "/colors"
        }
    }
    
    // 5
    var parameters: [String: Any] {
        switch self {
        case .tags(let contentID):
            return ["content": contentID]
        case .colors(let contentID):
            return ["content": contentID, "extract_object_colors": 0]
        default:
            return [:]
        }
    }
    
    // 6
    public func asURLRequest() throws -> URLRequest {
        //Create URL
        let url = try Client.instance.getBaseURL().asURL()
        
        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Client.instance.getHeaderToken(), forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
