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
    /**
     * Fetch the purchasers for a supplier retailer relationship
     * Returns a PurchaserResponse
     */
    func getPurchasers(retailerId: String, supplierId: String, completion: @escaping (Bool, PurchaserResponse?) -> ()) {
        //Build Route
        let route = PurchaserRouter.getPurchasers(retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the purchasers for a retailer with a given payment method
     * Returns a PurchaserResponse
     */
    func getPurchasersForPaymentMethod(retailerId: String, paymentMethodType: String, completion: @escaping (Bool, PurchaserResponse?) -> ()) {
        //Build Route
        let route = PurchaserRouter.getPurchasersForPaymentMethod(retailerId, paymentMethodType) as URLRequestConvertible
        
        //Call API
        Service<PurchaserResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Update a payment method
     * Returns a ResponseBody
     */
    func updatePaymentMethod(purchaserId: String, requestObject: UpdatePaymentMethodRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = PurchaserRouter.updatePaymentMethod(purchaserId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
