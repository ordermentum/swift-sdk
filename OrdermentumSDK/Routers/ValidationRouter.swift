//
//  ValidationRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ValidationRouter: URLRequestConvertible {
    //Routes
    case validateItems(ValidationRequestBody)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .validateItems:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .validateItems:
            return "cart/validate"
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
        case .validateItems(let requestObject):
            return requestObject
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
