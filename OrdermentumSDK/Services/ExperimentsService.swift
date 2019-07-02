//
//  ExperimentsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ExperimentsService {
    public init() {}
    
    /**
     * Get the experiments belonging to a user
     * Returns a ExperimentsResponse
     */
    public func getExperiments(slot: String, source: String, version: String, retailerId: String, isRetailer: Bool, userId: String, supplierIds: [String], completion: @escaping (Bool, ExperimentsResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ExperimentsRouter.getExperiments(slot, source, version, retailerId, isRetailer, userId, supplierIds) as URLRequestConvertible
        
        //Call API
        Service<ExperimentsResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Dismiss an experiment
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    public func dismissExperiment(_ requestObject: ExperimentsDismissRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = ExperimentsRouter.dismissExperiment(requestObject) as URLRequestConvertible
        
        //Call API
        Service<ExperimentsResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
