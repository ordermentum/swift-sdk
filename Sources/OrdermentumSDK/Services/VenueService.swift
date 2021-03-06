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
    public init() { }

    /**
     * Fetch a single venue by id
     * Returns a Venue object
     */
    public func getVenue(retailerId: String, completion: @escaping (Bool, Venue?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.getVenue(retailerId) as URLRequestConvertible

        //Call API
        Service<Venue, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch the venues of the currently logged in user
     * Returns a VenueResponse object
     */
    public func getVenues(retailerIdsArray: [String], pageSize: Int, pageNo: Int, completion: @escaping (Bool, VenueResponse?, ErrorResponse?) -> Void) {
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
    public func createVenues(_ requestObject: CreateVenueRequest, completion: @escaping (Bool, Venue?, ErrorResponse?) -> Void) {
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
    public func updateVenueProfile(retailerId: String, venueProfile: VenueProfile, completion: @escaping (Bool, VenueProfile?, ErrorResponse?) -> Void) {
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
    public func getProfileCompletion(retailerId: String, completion: @escaping (Bool, Completion?, ErrorResponse?) -> Void) {
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
    public func checkVenueInvites(_ recipientEmail: String, completion: @escaping (Bool, [VenueInvite]?, ErrorResponse?) -> Void) {
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
    public func sendVenueInvite(_ requestObject: AddUser, completion: @escaping (Bool, AddUserResponse?, ErrorResponse?) -> Void) {
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
    public func acceptAllInvites(_ completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.acceptAllInvites as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Requests to join a venue as a user
     * Returns success or fail
     */
    public func joinVenue(_ requestObject: JoinVenueRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.joinVenue(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Fetch the list of users that belong to a particular venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func getUsers(retailerId: String, completion: @escaping (Bool, VenueUsersResponse?, ErrorResponse?) -> Void) {
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
    public func removeUser(userId: String, requestObject: RemoveUser, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.removeUser(userId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Search for venues given a search string
     * Returns a VenueUsersResponse
     */
    public func searchVenues(searchQuery: String, completion: @escaping (Bool, VenueSearchResponse?, ErrorResponse?) -> Void) {
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
    public func getPendingVenues(completion: @escaping (Bool, VenueInviteResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.getPendingVenues as URLRequestConvertible

        //Call API
        Service<VenueInviteResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Update a batch of user positions within a venue
     * Returns success or fail
     */
    public func updateUserPositions(retailerId: String, requestObject: [String: [String]], completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.updateUserPositions(retailerId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Retrieves a single invite.
     * Returns a VenueInvite object.
     */
    public func getInvite(inviteId: String, token: String, completion: @escaping (Bool, VenueInvite?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.getInvite(inviteId, token) as URLRequestConvertible

        //Call API
        Service<VenueInvite, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Accepts a single invite.
     * Returns an AcceptInviteResponse which can be used to check for a 200 status which indicates a success OR an event id to monitor merge status.
     */
    public func acceptInvite(inviteId: String, token: String, requestObject: AcceptInviteRequest? = nil, completion: @escaping (Bool, AcceptInviteResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.acceptInvite(inviteId, token, requestObject) as URLRequestConvertible

        //Call API
        Service<AcceptInviteResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Retrieves the status of a merge request.
     * Returns a MergeStatus object.
     */
    public func getMergeStatus(mergeId: String, completion: @escaping (Bool, MergeStatus?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.getMergeStatus(mergeId) as URLRequestConvertible

        //Call API
        Service<MergeStatus, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     Merges one or more venues into another venue
     Returns a MergeVenueResponse which can be used to monitor the status of the merge event.
     */
    public func mergeVenues(requestObject: MergeVenuesRequest, completion: @escaping (Bool, MergeVenueResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = VenueRouter.mergeVenues(requestObject) as URLRequestConvertible

        //Call API
        Service<MergeVenueResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
