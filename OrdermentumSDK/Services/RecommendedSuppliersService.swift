//
//  RecommendedSuppliersService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 4/6/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class RecommendedSuppliersService {
    public init() {}
    
    /**
     * Fetch the recommended suppliers as an array of categories for a retailer
     * Returns a RecommendedSuppliersResponse Object
     */
    public func getRecommendedSuppliers(retailerId: String, completion: @escaping (Bool, RecommendedSupplierResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = RecommendedSuppliersRouter.getRecommendedSuppliers(retailerId) as URLRequestConvertible
        
        //Call API
        Service<RecommendedSupplierResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the top recommended suppliers as an array of recommended suppliers for a retailer
     * Returns a RecommendedSupplierTopResponse Object
     */
    public func getTopRecommendedSuppliers(retailerId: String, completion: @escaping (Bool, RecommendedSupplierTopResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = RecommendedSuppliersRouter.getTopRecommendedSuppliers(retailerId) as URLRequestConvertible
        
        //Call API
        Service<RecommendedSupplierTopResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
