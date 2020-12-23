//
//  SupportRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 23/3/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum SupportRouter: URLRequestConvertible {
    //Routes
    case createRequest(SupportRequest)
    case createTicket(SupportTicket)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .createRequest:
            return .post
        case .createTicket:
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
        case .createRequest:
            return "requests.json"
        case .createTicket:
            return "tickets.json?async=true"
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
        case .createRequest(let requestObject):
            return requestObject
        case .createTicket(let requestObject):
            return requestObject
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try SupportClient.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
