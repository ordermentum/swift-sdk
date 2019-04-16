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
    public init() {}
    
    /**
     * Send device details for a user to the Ordermentum service
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func registerDevice(requestObject: Device, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = DeviceRouter.registerDevice(requestObject) as URLRequestConvertible
        
        //Call API
        Service<DataAttributesResponse>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Remove device details for a user to the Ordermentum service
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func unregisterDevice(requestObject: Device, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = DeviceRouter.unregisterDevice(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Update the operating information of a venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func updateVenueOperations(retailerId: String, requestObject: VenueOperationsUpdate, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = DataAttributesRouter.updateVenueOperations(retailerId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
