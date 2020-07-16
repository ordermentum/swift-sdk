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
    public init() { }

    /**
     * Fetch the payment methods belonging to a retailer
     * Returns an array of PaymentMethod
     */
    public func getPaymentMethods(retailerId: String, completion: @escaping (Bool, [PaymentMethod]?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PaymentsRouter.getPaymentMethods(retailerId) as URLRequestConvertible

        //Call API
        Service<[PaymentMethod], ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch a single payment method belonging to a retailer
     * Returns a PaymentMethod
     */
    public func getSinglePaymentMethod(retailerId: String, paymentMethodId: String, completion: @escaping (Bool, PaymentMethod?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PaymentsRouter.getSinglePaymentMethod(retailerId, paymentMethodId) as URLRequestConvertible

        //Call API
        Service<PaymentMethod, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Create a payment method (credit card)
     * Takes a CreateCardPaymentMethodRequest object
     * Returns a PaymentMethod
     */
    public func createCardPaymentMethod(retailerId: String, requestObject: CreateCardPaymentMethodRequest, completion: @escaping (Bool, PaymentMethod?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PaymentsRouter.createCardPaymentMethod(retailerId, requestObject) as URLRequestConvertible
        //Call API
        Service<PaymentMethod, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Create a payment method (direct debit)
     * Takes a CreateDirectDebitPaymentMethodRequest object
     * Returns a PaymentMethod
     */
    public func createDebitPaymentMethod(retailerId: String, requestObject: CreateDirectDebitPaymentMethodRequest, completion: @escaping (Bool, PaymentMethod?, ErrorResponse?) -> Void) {
        //Build Route
        let route = PaymentsRouter.createDebitPaymentMethod(retailerId, requestObject) as URLRequestConvertible

        //Call API
        Service<PaymentMethod, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Delete a payment method
     * Returns a ResponseBody
     */
    public func deletePaymentMethod(retailerId: String, paymentMethodId: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = PaymentsRouter.deletePaymentMethod(retailerId, paymentMethodId) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
