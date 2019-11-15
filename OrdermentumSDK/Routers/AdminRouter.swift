//
//  AdminRouter.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 15/11/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum AdminRouter: URLRequestConvertible {
    //Routes
    case searchVenues(String, Int, Int)
    case searchVenuesByLocation(Float, Float, Int)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .searchVenues:
            return .get
        case .searchVenuesByLocation:
            return .get
        }
    }

    //Paths
    var path: String {
        switch self {
        case .searchVenues:
            return "retailers"
        case .searchVenuesByLocation:
            return "retailers"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .searchVenues(let searchQuery, let pageSize, let pageNo):
            return ["search": searchQuery, "pageSize": pageSize, "pageNo": pageNo]
        case .searchVenuesByLocation(let latitude, let longitude, let radius):
            return ["location": "[\(longitude), \(latitude)]", "radius": "\(radius)km"]
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        default:
            return nil
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
