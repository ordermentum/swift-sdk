//
//  DataAttributesRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum DataAttributesRouter: URLRequestConvertible {
    //Routes
    case getDataAttributes
    case updateVenueHours(String, DataAttributes)
    case updateVenueOperations(String, VenueOperationsUpdate)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getDataAttributes:
            return .get
        case .updateVenueHours:
            return .patch
        case .updateVenueOperations:
            return .patch
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
        case .getDataAttributes:
            return "data-attributes"
        case .updateVenueHours(let retailerId, _):
            return "retailers/\(retailerId)/data-attributes"
        case .updateVenueOperations(let retailerId, _):
             return "retailers/\(retailerId)/data-attributes"
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
        case .updateVenueHours(_, let requestObject):
            return requestObject
        case .updateVenueOperations(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
