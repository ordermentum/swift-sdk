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
    /**
     * Fetch the NPS parameters for the current user
     * which can be used to determine whether or not the NPS should be shown
     * Returns a NPSResponse
     */
    public func getNPS(completion: @escaping (Bool, NPSResponse?) -> ()) {
        //Build Route
        let route = NPSRouter.getNPS as URLRequestConvertible
        
        //Call API
        Service<NPSResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Submit an NPS response to the Ordermentum server
     * Returns a ResponseBody
     */
    public func sendFeedback(requestObject: NPSFeedback, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = NPSRouter.sendFeedback(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
