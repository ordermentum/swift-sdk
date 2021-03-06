//
//  PurchaserService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class PurchaserService {
    public init() {}
    
    /**
     * Create a purchaser relationship between a retailer and supplier
     * Returns a ResponseBody
     */
    public func createPurchaserRelationship(requestObject: CreatePurchaserRequest, completion: @escaping (Bool, Purchaser?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.createPurchaserRelationship(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Purchaser, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the purchasers for a supplier retailer relationship
     * Returns a PurchaserResponse
     */
    public func getPurchasers(retailerId: String, supplierId: String, completion: @escaping (Bool, PurchaserResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.getPurchasers(retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single purchaser record using its id
     * Returns a Purchaser
     */
    public func getPurchaser(purchaserId: String, completion: @escaping (Bool, Purchaser?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.getPurchaser(purchaserId) as URLRequestConvertible
        
        //Call API
        Service<Purchaser, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the purchasers for a retailer with a given payment method
     * Returns a PurchaserResponse
     */
    public func getPurchasersForPaymentMethod(retailerId: String, paymentMethodType: String, completion: @escaping (Bool, PurchaserResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.getPurchasersForPaymentMethod(retailerId, paymentMethodType) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Update a payment method
     * Returns a ResponseBody
     */
    public func updatePaymentMethod(purchaserId: String, requestObject: UpdatePaymentMethodRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.updatePaymentMethod(purchaserId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Retrieve the terms and conditions belonging to a purchaser relationship
     * Returns a PurchaserTerms object
     */
    public func getTermsAndConditions(supplierId: String, retailerId: String, completion: @escaping (Bool, PurchaserTerms?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.getTermsAndConditions(supplierId, retailerId) as URLRequestConvertible
        
        //Call API
        Service<PurchaserTerms, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Accept the terms and conditions of a purchaser relationship
     * Returns a ResponseBody
     */
    public func acceptTermsAndConditions(supplierId: String, retailerId: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = PurchaserRouter.acceptTermsAndConditions(supplierId, retailerId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
