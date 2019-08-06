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
    public func getMarketplaces(retailerId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, MarketplaceResponse?, ErrorResponse?) -> ()) {
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
    public func getSupplier(supplierId: String, completion: @escaping (Bool, Supplier?, ErrorResponse?) -> ()) {
        //Build Route
        let route = MarketplaceRouter.getSupplier(supplierId) as URLRequestConvertible
        
        //Call API
        Service<Supplier, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}

