//
//  ValidationService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class ValidationService {
    /**
     * Validate a list of products to ensure that they are orderable in their
     * current configuration.
     * Returns a Profile.UserProfile
     */
    func validateItems(requestObject: ValidationRequestBody, completion: @escaping (Bool, Validation?) -> ()) {
        //Build Route
        let route = ValidationRouter.validateItems(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Validation>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
}