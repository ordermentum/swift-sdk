//
//  DataAttributesService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class DataAttributesService {
    /**
     * Get the data attributes currently available on the Ordermentum Service
     * Returns a DataAttributesResponse object
     */
    public func getDataAttributes(purchaserId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, DataAttributesResponse?) -> ()) {
        //Build Route
        let route = DataAttributesRouter.getDataAttributes as URLRequestConvertible
        
        //Call API
        Service<DataAttributesResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Update the business hours of a venue
     * Returns a ResponseBody which can be used to check for a 200 status which indicates a success.
     */
    public func updateVenueHours(retailerId: String, requestObject: DataAttributes, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = DataAttributesRouter.updateVenueHours(retailerId, requestObject) as URLRequestConvertible
        
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
