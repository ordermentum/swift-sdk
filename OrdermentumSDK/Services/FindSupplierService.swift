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
    /**
     * Get suppliers available based on search string
     * Returns a FindSupplierResponse
     */
    func getSuppliers(searchString: String, pageSize: Int, completion: @escaping (Bool, FindSupplierResponse?) -> ()) {
        //Build Route
        let route = FindSupplierRouter.getSuppliers(searchString, pageSize) as URLRequestConvertible
        
        //Call API
        Service<FindSupplierResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Send an enquiry requesting that a retailer be joined with a supplier
     * Returns a response body which can be used to check for a 200 response
     */
    func sendSupplierEnquiry(requestObject: FindSupplierRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = FindSupplierRouter.sendSupplierEnquiry(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Send an enquiry requesting that a supplier be added to the Ordermentum network
     * Returns a response body which can be used to check for a 200 response
     */
    func sendSupplierReferral(requestObject: FindSupplierReferralRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = FindSupplierRouter.sendSupplierReferral(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
