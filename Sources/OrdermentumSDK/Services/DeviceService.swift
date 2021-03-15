//
//  DeviceService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class DeviceService {
    public init() { }

    /**
     * Send device details for a user to the Ordermentum service
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func registerDevice(_ requestObject: Device, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = DeviceRouter.registerDevice(requestObject) as URLRequestConvertible

        //Call API
        Service<DataAttributesResponse, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Remove device details for a user to the Ordermentum service
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func unregisterDevice(_ requestObject: Device, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = DeviceRouter.unregisterDevice(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Update the operating information of a venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func updateVenueOperations(retailerId: String, requestObject: VenueOperationsUpdate, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = DataAttributesRouter.updateVenueOperations(retailerId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
