//
//  ProductsServiceV2.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 11/30/20.
//

import Foundation
import Alamofire

public class ProductsServiceV2 {
    public init() {}
    
    /**
     * Fetch for products
     * Accepts: retailerId string and ProductSearchRequest obj
     * Returns a ProductResponse object
     */
    public func fetchProducts(retailerId: String, requestObject: ProductSearchRequest, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouterV2.fetchProducts(retailerId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
