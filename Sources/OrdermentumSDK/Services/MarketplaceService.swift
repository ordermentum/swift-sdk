//
//  MarketplaceService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class MarketplaceService {
    public init() {}
    
    /**
     * Fetch the marketplaces for a selected retailer
     * Returns a Marketplace object
     */
    public func getMarketplaces(retailerId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, MarketplaceResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = MarketplaceRouter.getMarketplaces(retailerId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<MarketplaceResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single Supplier
     * Returns a Supplier object
     */
    public func getSupplier(supplierId: String, completion: @escaping (Bool, Supplier?, ErrorResponse?) -> Void) {
        //Build Route
        let route = MarketplaceRouter.getSupplier(supplierId) as URLRequestConvertible
        
        //Call API
        Service<Supplier, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single recommended supplier
     * Returns a RecommendedSupplier object
     */
    public func getRecommendedSupplier(supplierId: String, completion: @escaping (Bool, RecommendedSupplier?, ErrorResponse?) -> Void) {
        //Build Route
        let route = MarketplaceRouter.getRecommendedSupplier(supplierId) as URLRequestConvertible
        
        //Call API
        Service<RecommendedSupplier, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch a list of pending supplier requests from a retailer
     * Returns an array of PendingSupplier objects
     */
    public func getPendingSuppliers(retailerId: String, completion: @escaping (Bool, [ConnectionRequest]?, ErrorResponse?) -> Void) {
        //Build Route
        let route = MarketplaceRouter.getPendingSuppliers(retailerId) as URLRequestConvertible

        //Call API
        Service<[ConnectionRequest], ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
