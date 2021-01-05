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
     * Checks the current logged in user against the given `cartId` for an abandoned cart.
     * Returns a `HydrateResponse` object which can be used to populate the local cart
     */
    public func hydrateCart(cartId: String, completion: @escaping (Bool, HydrateResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = CartRouter.hydrate(cartId) as URLRequestConvertible
        
        //Call API
        Service<HydrateResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    
    /// Sends a request to the ordermentum service notifying it that the logged in user has added/removed items from their cart. This in-turn, allows for the abandoned cart functionality to work.
    /// - Parameters:
    ///   - requestObject: An object representing the actions taken on the cart for a given supplier/retailer/purchaser relationship
    ///   - completion: Completion block allowing for asynchronous callback handling.
    public func populateCart(_ requestObject: CartActionRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = CartRouter.populateCart(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
