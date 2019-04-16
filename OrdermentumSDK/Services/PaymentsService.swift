//
//  PaymentsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class PaymentsService {
    /**
     * Fetch the payment methods belonging to a retailer
     * Returns an array of PaymentMethod
     */
    func getPaymentMethods(retailerId: String, completion: @escaping (Bool, [PaymentMethod]?) -> ()) {
        //Build Route
        let route = PaymentsRouter.getPaymentMethods(retailerId) as URLRequestConvertible
        
        //Call API
        Service<[PaymentMethod]>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch a single payment method belonging to a retailer
     * Returns a PaymentMethod
     */
    func getSinglePaymentMethod(retailerId: String, paymentMethodId: String, completion: @escaping (Bool, PaymentMethod?) -> ()) {
        //Build Route
        let route = PaymentsRouter.getSinglePaymentMethod(retailerId, paymentMethodId) as URLRequestConvertible
        
        //Call API
        Service<PaymentMethod>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Create a payment method (credit card)
     * Takes a CreateCardPaymentMethodRequest object
     * Returns a PaymentMethod
     */
    func createCardPaymentMethod(retailerId: String, requestObject: CreateCardPaymentMethodRequest, completion: @escaping (Bool, PaymentMethod?) -> ()) {
        //Build Route
        let route = PaymentsRouter.createCardPaymentMethod(retailerId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<PaymentMethod>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Create a payment method (direct debit)
     * Takes a CreateDirectDebitPaymentMethodRequest object
     * Returns a PaymentMethod
     */
    func createDebitPaymentMethod(retailerId: String, requestObject: CreateDirectDebitPaymentMethodRequest, completion: @escaping (Bool, PaymentMethod?) -> ()) {
        //Build Route
        let route = PaymentsRouter.createDebitPaymentMethod(retailerId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<PaymentMethod>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Delete a payment method
     * Returns a ResponseBody
     */
    func deletePaymentMethod(retailerId: String, paymentMethodId: String, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = PaymentsRouter.deletePaymentMethod(retailerId, paymentMethodId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
