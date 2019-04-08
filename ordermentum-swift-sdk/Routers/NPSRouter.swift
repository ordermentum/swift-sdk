//
//  NPSRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum NPSRouter: URLRequestConvertible {
    //Routes
    case getNPS
    case sendFeedback(NPSFeedback)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getNPS:
            return .get
        case .sendFeedback:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getNPS:
            return "nps"
        case .sendFeedback:
            return "nps"
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
        case .sendFeedback(let requestObject):
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
