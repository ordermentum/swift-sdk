//
//  AddOnsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class AddOnsService {
    public init() {}
    
    /**
     * Get already connected add-ons
     * Returns a AddOnsResponse
     */
    public func searchAddons(entityType: String, entityId: String, completion: @escaping (Bool, [AddOn]?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AddOnsRouter.searchAddons(entityType, entityId) as URLRequestConvertible
        
        //Call API
        Service<[AddOn], ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get non-connected add-ons
     * Returns a AddOnsDiscoverResponse
     */
    public func discoverAddons(entityType: String, entityId: String, completion: @escaping (Bool, [AddOnsDiscover]?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AddOnsRouter.discoverAddons(entityType, entityId) as URLRequestConvertible
        
        //Call API
        Service<[AddOnsDiscover], ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Get details of an already connected add-on
     * Returns an AddOn Object
     */
    public func readAddon(addonId: String, accountId: String, completion: @escaping (Bool, AddOn?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AddOnsRouter.readAddon(addonId, accountId) as URLRequestConvertible
        
        //Call API
        Service<AddOn, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Update an add-on
     * Returns an AddOn Object
     */
    public func updateAddon(addonId: String, requestObject: AddOnUpdateObject, completion: @escaping (Bool, AddOn?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AddOnsRouter.updateAddon(addonId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<AddOn, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Disconnect an add-on
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    public func disconnectAddon(addonId: String, requestObject: AddOnDisconnectObject, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = AddOnsRouter.disconnectAddon(addonId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
