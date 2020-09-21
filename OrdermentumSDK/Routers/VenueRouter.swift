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
    case getVenue(String)
    case getVenues([String], Int, Int)
    case createVenue(CreateVenueRequest)
    case updateVenueProfile(String, VenueProfile)
    case getProfileCompletion(String)
    case getInvite(String, String)
    case getVenueInvites(String)
    case sendVenueInvite(AddUser)
    case acceptAllInvites
    case getUsers(String)
    case removeUser(String, RemoveUser)
    case searchVenue(String)
    case joinVenue(JoinVenueRequest)
    case getPendingVenues
    case updateUserPositions(String, [String: [String]])
    case acceptInvite(String, String, AcceptInviteRequest?)
    case getMergeStatus(String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getVenue:
            return .get
        case .getVenues:
            return .get
        case .createVenue:
            return .post
        case .updateVenueProfile:
            return .patch
        case .getProfileCompletion:
            return .get
        case .getInvite:
            return .get
        case .getVenueInvites:
            return .get
        case .sendVenueInvite:
            return .post
        case .acceptAllInvites:
            return .post
        case .getUsers:
            return .get
        case .removeUser:
            return .put
        case .searchVenue:
            return .get
        case .joinVenue:
            return .post
        case .getPendingVenues:
            return .get
        case .updateUserPositions:
            return .put
        case .acceptInvite:
            return .post
        case .getMergeStatus:
            return .get
        }
    }

    //Paths
    var path: String {
        switch self {
        case .getVenue(let retailerId):
            return "retailers/\(retailerId)"
        case .getVenues:
            return "retailers"
        case .createVenue:
            return "venues/signup"
        case .updateVenueProfile(let retailerId, _):
            return "retailers/\(retailerId)"
        case .getProfileCompletion(let retailerId):
            return "retailers/\(retailerId)/profile"
        case .getInvite(let inviteId, _):
            return "invites/\(inviteId)"
        case .getVenueInvites:
            return "invites"
        case .sendVenueInvite:
            return "invites"
        case .acceptAllInvites:
            return "invites/accept-all"
        case .getUsers:
            return "users"
        case .removeUser(let userId, _):
            return "entities/\(userId)/permissions"
        case .searchVenue:
            return "venues/directory"
        case .joinVenue:
            return "venues/join"
        case .getPendingVenues:
            return "venues/pending-requests"
        case .updateUserPositions(let retailerId, _):
            return "retailers/\(retailerId)/user-positions"
        case .acceptInvite(let inviteId, _, _):
            return "invites/\(inviteId)/accept"
        case .getMergeStatus(let mergeId):
            return "retailers/merge/\(mergeId)/status"
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
            return ["recipientEmail": recipientEmail, "status": "approved"]
        case .searchVenue(let searchQuery):
            return ["search": searchQuery]
        case .getInvite(_, let token):
            return ["token": token]
        case .acceptInvite(_, let token, _):
            return ["token": token]
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .createVenue(let requestObject):
            return requestObject
        case .updateVenueProfile(_, let requestObject):
            return requestObject
        case .sendVenueInvite(let requestObject):
            return requestObject
        case .removeUser(_, let requestObject):
            return requestObject
        case .joinVenue(let requestObject):
            return requestObject
        case .updateUserPositions(_, let requestObject):
            return requestObject
        case .acceptInvite(_, _, let requestObject):
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
