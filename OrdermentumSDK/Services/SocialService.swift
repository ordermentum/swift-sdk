//
//  SocialService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 29/6/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class SocialService {
    public init() {}
    
    /**
     * Upgrades a Google© `idToken` to an Ordermentum auth token.
     * Returns an `TokenUpgradeResponse` which can be used to authorise a user on Ordermentum
     */
    public func upgradeGoogleToken(request: TokenUpgradeRequest, completion: @escaping (Bool, TokenUpgradeResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = SocialRouter.upgradeGoogleToken(request) as URLRequestConvertible
        
        //Call API
        Service<TokenUpgradeResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}

