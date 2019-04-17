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
    public func getMarketplaces(retailerId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, MarketplaceResponse?) -> ()) {
        //Build Route
        let route = MarketplaceRouter.getMarketplaces(retailerId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<MarketplaceResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
}

