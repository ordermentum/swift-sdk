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
     * Fetch the purchasers for a supplier retailer relationship
     * Returns a PurchaserResponse
     */
    public func getPurchasers(retailerId: String, supplierId: String, completion: @escaping (Bool, PurchaserResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = PurchaserRouter.getPurchasers(retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the purchasers for a retailer with a given payment method
     * Returns a PurchaserResponse
     */
    public func getPurchasersForPaymentMethod(retailerId: String, paymentMethodType: String, completion: @escaping (Bool, PurchaserResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = PurchaserRouter.getPurchasersForPaymentMethod(retailerId, paymentMethodType) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Update a payment method
     * Returns a ResponseBody
     */
    public func updatePaymentMethod(purchaserId: String, requestObject: UpdatePaymentMethodRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = PurchaserRouter.updatePaymentMethod(purchaserId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
}
