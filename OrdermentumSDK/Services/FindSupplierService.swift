//
//  FindSupplierService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class FindSupplierService {
    public init() {}
    
    /**
     * Get suppliers available based on search string
     * Returns a FindSupplierResponse
     */
    public func getSuppliers(searchString: String, pageSize: Int, retailerId: String, completion: @escaping (Bool, FindSupplierResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = FindSupplierRouter.getSuppliers(searchString, pageSize, retailerId) as URLRequestConvertible
        
        //Call API
        Service<FindSupplierResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Send an enquiry requesting that a retailer be joined with a supplier
     * Returns a response body which can be used to check for a 200 response
     */
    public func sendSupplierEnquiry(_ requestObject: FindSupplierRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = FindSupplierRouter.sendSupplierEnquiry(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Send an enquiry requesting that a supplier be added to the Ordermentum network
     * Returns a response body which can be used to check for a 200 response
     */
    public func sendSupplierReferral(_ requestObject: FindSupplierReferralRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = FindSupplierRouter.sendSupplierReferral(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
