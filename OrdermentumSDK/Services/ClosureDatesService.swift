//
//  ClosureDatesService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ClosureDatesService {
    public init() {}
    
    /**
     * Get the closure periods belonging to a retailer
     * Returns a ClosurePeriodsResponse
     */
    public func getClosurePeriods(_ retailerId: String, _ pageSize: Int, _ pageNo: Int, completion: @escaping (Bool, ClosurePeriodsResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ClosurePeriodsRouter.getClosurePeriods(retailerId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ClosurePeriodsResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Create a closure period for the currently authenticated user
     * Returns a ClosurePeriodsResponse
     */
    public func createClosurePeriod(_ requestObject: ClosurePeriod, completion: @escaping (Bool, ClosurePeriodsResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ClosurePeriodsRouter.createClosurePeriod(requestObject) as URLRequestConvertible
        
        //Call API
        Service<ClosurePeriodsResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Update an existing closure period
     * Returns a response body which can be used to check for a 200 response
     */
    public func updateClosurePeriod(closurePeriodId: String, requestObject: ClosurePeriod, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = ClosurePeriodsRouter.updateClosurePeriod(closurePeriodId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Delete an existing closure period
     * Returns a response body which can be used to check for a 200 response
     */
    public func deleteClosurePeriod(closurePeriodId: String, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = ClosurePeriodsRouter.deleteClosurePeriod(closurePeriodId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
