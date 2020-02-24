//
//  ProfileService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum OMProfileCompletionCodes {
    case NETWORK_ERROR
    case INVALID_SERVER_RESPONSE
    case ERROR_PROCESSING_JSON
    case SUCCESS
    case ERROR
}

public class ProfileService {
    public init() { }

    /**
     * Fetch the currently logged in users profile
     * Returns a UserProfile
     */
    public func getProfile(completion: @escaping (Bool, UserProfile?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProfileRouter.getProfile as URLRequestConvertible

        //Call API
        Service<UserProfile, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Takes a Profile.UpdateUserRequest object and updates the logged in user.
     * Returns a response body which can be used to check for a 200 status which indicates a success.
     */
    public func updateProfile(userId: String, requestObject: UpdateUserRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProfileRouter.updateProfile(userId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Update a batch of venue positions for a user
     * Returns a success of failure
     */
    public func updateVeneuPositions(userId: String, requestObject: [String: [String]], completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProfileRouter.updateVenuePositions(userId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
