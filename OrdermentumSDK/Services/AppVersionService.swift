//
//  AppVersionService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 26/7/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation
import Alamofire

public class AppVersionService {
    public init() {}
    
    /**
     * Check for the latest required version of the iOS application
     * Returns an AppVersion object
     */
    public func checkVersion(completion: @escaping (Bool, AppVersion?, ErrorResponse?) -> ()) {
        //Build Route
        let route = AppVersionRouter.checkVersion as URLRequestConvertible
        
        //Call API
        Service<AppVersion, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
