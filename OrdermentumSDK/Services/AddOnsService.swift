//
//  AddOnsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class AddOnsService {
    /**
     * Get already connected add-ons
     * Returns a AddOnsResponse
     */
    func searchAddons(entityType: String, entityId: [String], completion: @escaping (Bool, [AddOn]?) -> ()) {
        //Build Route
        let route = AddOnsRouter.searchAddons(entityType, entityId) as URLRequestConvertible
        
        //Call API
        Service<[AddOn]>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }

    /**
     * Get non-connected add-ons
     * Returns a AddOnsDiscoverResponse
     */
    func discoverAddons(entityType: String, entityId: String, completion: @escaping (Bool, [AddOnsDiscover]?) -> ()) {
        //Build Route
        let route = AddOnsRouter.discoverAddons(entityType, entityId) as URLRequestConvertible
        
        //Call API
        Service<[AddOnsDiscover]>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }

    /**
     * Get details of an already connected add-on
     * Returns an AddOn Object
     */
    func readAddon(addonId: String, accountId: String, completion: @escaping (Bool, AddOn?) -> ()) {
        //Build Route
        let route = AddOnsRouter.readAddon(addonId, accountId) as URLRequestConvertible
        
        //Call API
        Service<AddOn>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Update an add-on
     * Returns an AddOn Object
     */
    func updateAddon(addonId: String, accountId: String, requestObject: AddOnUpdateObject, completion: @escaping (Bool, AddOn?) -> ()) {
        //Build Route
        let route = AddOnsRouter.updateAddon(addonId, accountId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<AddOn>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Disconnect an add-on
     * Returns a ResponseBody which can be used to check for a 200 response
     */
    func disconnectAddon(addonId: String, accountId: String, requestObject: AddOnDisconnectObject, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = AddOnsRouter.disconnectAddon(addonId, accountId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
