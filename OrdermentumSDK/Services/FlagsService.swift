//
//  FlagsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class FlagsService {
    public init() {}
    
    /**
     * Get the flags belonging to a multip retailer/supplier relationships
     * Returns a Flags object
     */
    public func getFlags(flagsArray: [String], supplierIdArray: [String], retailerId: String, userId: String, isRetailer: Bool, completion: @escaping (Bool, Flags?, ErrorResponse?) -> Void) {
        //Build Route
        let route = FlagsRouter.getFlags(flagsArray, supplierIdArray, retailerId, userId, isRetailer) as URLRequestConvertible
        
        //Call API
        Service<Flags, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get the flags belonging to a single retailer/supplier relationship
     * Returns a Flags object
     */
    public func getMarketplaceFlags(flagsArray: [String], supplierId: String, retailerId: String, userId: String, isRetailer: Bool, completion: @escaping (Bool, Flags?, ErrorResponse?) -> Void) {
        //Build Route
        let route = FlagsRouter.getMarketplaceFlags(flagsArray, supplierId, retailerId, userId, isRetailer) as URLRequestConvertible
        
        //Call API
        Service<Flags, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
