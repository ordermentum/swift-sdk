//
//  ValidationService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ValidationService {
    public init() {}
    
    /**
     * Validate a list of products to ensure that they are orderable in their
     * current configuration.
     * Returns a Profile.UserProfile
     */
    public func validateItems(_ requestObject: ValidationRequestBody, completion: @escaping (Bool, Validation?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ValidationRouter.validateItems(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Validation, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
