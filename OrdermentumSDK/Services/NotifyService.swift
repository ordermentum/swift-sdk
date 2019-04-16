//
//  NotifyService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class NotifyService {
    public init() {}
    
    /**
     * Send device details for a user to the Ordermentum service
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func registerDevice(requestObject: NotifyBody, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = NotifyRouter.registerDevice(requestObject) as URLRequestConvertible
        
        //Call API
        Service<FindSupplierResponse>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
