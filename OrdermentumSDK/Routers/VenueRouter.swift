//
//  VenueRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum VenueRouter: URLRequestConvertible {
    //Routes
    case getVenues([String], Int, Int)
    case updateVenueProfile(String, VenueProfile)
    case getProfileCompletion(String)
    case getVenueInvites(String)
    case sendVenueInvite(AddUser)
    case getUsers(String)
    case removeUser(String, RemoveUser)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getVenues:
            return .get
        case .updateVenueProfile:
            return .patch
        case .getProfileCompletion:
            return .get
        case .getVenueInvites:
            return .get
        case .sendVenueInvite:
            return .post
        case .getUsers:
            return .get
        case .removeUser:
            return .put
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getVenues:
            return "retailers"
        case .updateVenueProfile(let retailerId, _):
            return "retailers/\(retailerId)"
        case .getProfileCompletion(let retailerId):
            return "retailers/\(retailerId)/profile"
        case .getVenueInvites:
            return "invites"
        case .sendVenueInvite:
            return "invites"
        case .getUsers:
            return "users"
        case .removeUser(let userId, _):
            return "entities/\(userId)/permissions"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getVenues(let idArray, let pageSize, let pageNo):
            return ["id[]": idArray, "pageSize": pageSize, "pageNo": pageNo]
        case .getUsers(let retailerId):
            return ["retailerId": retailerId]
        case .getVenueInvites(let recipientEmail):
            return ["recipientEmail":recipientEmail, "status":"approved"]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .updateVenueProfile(_, let requestObject):
            return requestObject
        case .sendVenueInvite(let requestObject):
            return requestObject
        case .removeUser(_, let requestObject):
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
