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
    public func getVenues(retailerIdsArray: [String], pageSize: Int, pageNo: Int, completion: @escaping (Bool, VenueResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getVenues(retailerIdsArray, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<VenueResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Create a new venue
     * Returns a Venue object
     */
    public func createVenues(_ requestObject: CreateVenueRequest, completion: @escaping (Bool, Venue?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.createVenue(requestObject) as URLRequestConvertible
        
        //Call API
        Service<CreateVenueResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject?.retailer, errorObject)
        }
    }
    
    /**
     * Takes a VenueProfile object and updates the selected retailer.
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func updateVenueProfile(retailerId: String, venueProfile: VenueProfile , completion: @escaping (Bool, VenueProfile?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.updateVenueProfile(retailerId, venueProfile) as URLRequestConvertible
        
        //Call API
        Service<VenueProfile, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Retrieve the profile completion as a percentage value
     * Returns a Venue.Completion as an optional
     */
    public func getProfileCompletion(retailerId: String, completion: @escaping (Bool, Completion?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getProfileCompletion(retailerId) as URLRequestConvertible
        
        //Call API
        Service<Completion, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetches venue invites to a user using given email
     * Returns a VenueInviteResponse
     */
    public func checkVenueInvites(_ recipientEmail: String, completion: @escaping (Bool, [VenueInvite]?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getVenueInvites(recipientEmail) as URLRequestConvertible
        
        //Call API
        Service<[VenueInvite], ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Send an invite to a user for a particular venue
     * Returns an AddUserResponse
     */
    public func sendVenueInvite(_ requestObject: AddUser, completion: @escaping (Bool, AddUserResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.sendVenueInvite(requestObject) as URLRequestConvertible
        
        //Call API
        Service<AddUserResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Accepts all venue invites of the user
     * Returns success or fail
     */
    public func acceptAllInvites(_ completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.acceptAllInvites as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Requests to join a venue as a user
     * Returns success or fail
     */
    public func joinVenue(_ requestObject: JoinVenueRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.joinVenue(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Fetch the list of users that belong to a particular venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func getUsers(retailerId: String, completion: @escaping (Bool, VenueUsersResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getUsers(retailerId) as URLRequestConvertible
        
        //Call API
        Service<VenueUsersResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Remove a user from a particular venue
     * Returns a VenueUsersResponse
     */
    public func removeUser(userId: String, requestObject: RemoveUser, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.removeUser(userId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Search for venues given a search string
     * Returns a VenueUsersResponse
     */
    public func searchVenues(searchQuery: String, completion: @escaping (Bool, VenueSearchResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.searchVenue(searchQuery) as URLRequestConvertible
        
        //Call API
        Service<VenueSearchResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the pending venues of the currently logged in user
     * Returns a VenueInvite
     */
    public func getPendingVenues(completion: @escaping (Bool, VenueInviteResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueRouter.getPendingVenues as URLRequestConvertible
        
        //Call API
        Service<VenueInviteResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
