//
//  ProfileServiceV2.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 11/3/20.
//

import Foundation
import Alamofire

public class ProfileServiceV2 {
    public init() { }

    /**
     * Fetch the
     * Returns a UserProfile
     */
    public func checkProfile(code: String, supplierId: String, completion: @escaping (Bool, SupplierSignupProfile?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProfileRouterV2.checkProfile(code, supplierId) as URLRequestConvertible

        //Call API
        Service<SupplierSignupProfile, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
