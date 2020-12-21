//
//  CartService.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 21/12/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class CartService {
    public init() {}
    
    /**
     * Checks the current logged in user against the given `supplierId` for an abandoned cart.
     * Returns a `HydrateResponse` object which can be used to populate the local cart
     */
    public func hydrateCart(supplierId: String, completion: @escaping (Bool, HydrateResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = CartRouter.hydrate(supplierId) as URLRequestConvertible
        
        //Call API
        Service<HydrateResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
