//
//  AdminService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 15/11/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class AdminService {
    public init() { }

    /**
     * Search the directory of available venues by passing in a String.
     * This is different to VenueService.searchVenues() in that it returns actual Venue objects.
     * Returns a VenueResponse object
     */
    public func searchVenues(searchQuery: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, VenueResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = AdminRouter.searchVenues(searchQuery, pageSize, pageNo) as URLRequestConvertible

        //Call API
        Service<VenueResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
    * Search the directory of available venues by passing in a latitude and longitude.
    * This is different to VenueService.searchVenues() in that it returns actual Venue objects.
    * Returns a VenueResponse object
    */
    public func searchVenues(latitude: Float , longitude: Float, radius: Int, completion: @escaping (Bool, VenueResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = AdminRouter.searchVenuesByLocation(latitude, longitude, radius) as URLRequestConvertible

        //Call API
        Service<VenueResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
