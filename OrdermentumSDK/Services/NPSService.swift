//
//  NPSService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class NPSService {
    public init() {}
    
    /**
     * Fetch the NPS parameters for the current user
     * which can be used to determine whether or not the NPS should be shown
     * Returns a NPSResponse
     */
    public func getNPS(completion: @escaping (Bool, NPSResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = NPSRouter.getNPS as URLRequestConvertible
        
        //Call API
        Service<NPSResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Submit an NPS response to the Ordermentum server
     * Returns a ResponseBody
     */
    public func sendFeedback(_ requestObject: NPSFeedback, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = NPSRouter.sendFeedback(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
