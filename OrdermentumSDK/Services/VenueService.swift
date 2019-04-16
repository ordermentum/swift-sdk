//
//  VenueService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class VenueService {
    public init() {}
    
    /**
     * Fetch the venues of the currently logged in user
     * Returns a Venue object
     */
    public func getVenues(retailerIdsArray: [String], pageSize: Int, pageNo: Int, completion: @escaping (Bool, VenueResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getVenues(retailerIdsArray, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<VenueResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Takes a VenueProfile object and updates the selected retailer.
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func updateVenueProfile(retailerIdsArray: [String], pageSize: Int, pageNo: Int, completion: @escaping (Bool, VenueResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getVenues(retailerIdsArray, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<VenueResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Retrieve the profile completion as a percentage value
     * Returns a Venue.Completion as an optional
     */
    public func getProfileCompletion(retailerId: String, completion: @escaping (Bool, Completion?) -> ()) {
        //Build Route
        let route = VenueRouter.getProfileCompletion(retailerId) as URLRequestConvertible
        
        //Call API
        Service<Completion>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Send an invite to a user for a particular venue
     * Returns an AddUserResponse
     */
    public func sendVenueInvite(requestObject: AddUser, completion: @escaping (Bool, AddUserResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.sendVenueInvite(requestObject) as URLRequestConvertible
        
        //Call API
        Service<AddUserResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the list of users that belong to a particular venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func getUsers(retailerId: String, completion: @escaping (Bool, VenueUsersResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getUsers(retailerId) as URLRequestConvertible
        
        //Call API
        Service<VenueUsersResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Remove a user from a particular venue
     * Returns a VenueUsersResponse
     */
    public func removeUser(userId: String, requestObject: RemoveUser, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = VenueRouter.removeUser(userId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
