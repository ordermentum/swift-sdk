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
    case impersonateUser(String)
    case searchVenues(String, Int, Int)
    case searchVenuesByLocation(Float, Float, Int, Int)
    case getVenueInvites(String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .impersonateUser:
            return .get
        case .searchVenues:
            return .get
        case .searchVenuesByLocation:
            return .get
        case .getVenueInvites:
            return .get
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
        case .impersonateUser(let userId):
            return "ops/impersonate/\(userId)/app"
        case .searchVenues:
            return "retailers"
        case .searchVenuesByLocation:
            return "retailers"
        case .getVenueInvites:
            return "invites"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .searchVenues(let searchQuery, let pageSize, let pageNo):
            return ["search": searchQuery, "pageSize": pageSize, "pageNo": pageNo]
        case .searchVenuesByLocation(let latitude, let longitude, let radius, let pageSize):
            return ["location[latitude]": "\(latitude)", "location[longitude]": "\(longitude)", "radius": "\(radius)km", "pageSize": pageSize]
        case .getVenueInvites(let entityId):
            return ["recipientEntityId": entityId]
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
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
