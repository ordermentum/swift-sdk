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
     * Get the flags belonging to a retailer/supplier relationship
     * Returns a Flags object
     */
    public func getFlags(flagsArray: [String], supplierIdArray: [String], retailerId: String, userId: String, completion: @escaping (Bool, Flags?, ErrorResponse?) -> ()) {
        //Build Route
        let route = FlagsRouter.getFlags(flagsArray, supplierIdArray, retailerId, userId) as URLRequestConvertible
        
        //Call API
        Service<Flags>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
