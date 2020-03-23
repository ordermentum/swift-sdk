//
//  SupportService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 23/3/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class SupportService {
    public init() {}
    
    /**
     * Create a ZenDesk request
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func createRequest(request: SupportRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = SupportRouter.createRequest(request) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Create a ZenDesk ticket
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func createTicket(ticket: SupportTicket, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = SupportRouter.createTicket(ticket) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}

