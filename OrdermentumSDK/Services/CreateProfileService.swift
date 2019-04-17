//
//  CreateProfileService.swift
//  OrdermentumSDK
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class CreateProfileService {
    /**
     * Create new user
     * Returns success string response if user is created successfully else
     * err string
     */
    func createUserProfile(requestObject: CreateUserProfile, completion: @escaping (Bool) -> ()) {
        //Builld Route
        let route = CreateProfileRouter.createProfile(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
