//
//  ProfileService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ProfileService {
    /**
     * Fetch the currently logged in users profile
     * Returns a UserProfile
     */
    func getProfile(completion: @escaping (Bool, UserProfile?) -> ()) {
        //Build Route
        let route = ProfileRouter.getProfile as URLRequestConvertible
        
        //Call API
        Service<UserProfile>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Takes a Profile.UpdateUserRequest object and updates the logged in user.
     * Returns a response body which can be used to check for a 200 status which indicates a success.
     */
    func updateProfile(userId: String, requestObject: UpdateUserRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = ProfileRouter.updateProfile(userId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
