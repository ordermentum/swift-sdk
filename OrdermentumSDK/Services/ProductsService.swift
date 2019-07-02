//
//  ProductsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ProductsService {
    public init() {}
    
    /**
     * Fetch the product categories for a particular supplier-retailer relationship
     * Returns a Category object
     */
    public func getProductCategories(retailerId: String, supplierId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, CategoryResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getProductCategories(retailerId, supplierId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single category for a particular categoryId and supplier-retailer relationship
     * Returns a Category object
     */
    public func getCategory(categoryId: String, retailerId: String, supplierId: String, completion: @escaping (Bool, CategoryResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getCategory(categoryId, retailerId, supplierId ) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the products belonging to a particular category
     * Returns a Product object
     */
    public func getProducts(categoryId: String, retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getProducts(categoryId, retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the most ordered products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getMostOrderedProducts(retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getMostOrderedProducts(retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the trending products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getTrendingProducts(retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getTrendingProducts(retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the recommended products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getRecommendedProducts(retailerId: String, supplierId: String, pageSize: Int, excludedProductIdsArray: [String], completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getRecommendedProducts(retailerId, supplierId, pageSize, excludedProductIdsArray) as URLRequestConvertible

        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Search for products
     * Returns a list of ProductResponse
     */
    public func searchProducts(search: String, retailerId: String, supplierId: String, visible: Bool, pageSize: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.searchProducts(search, retailerId, supplierId, visible, pageSize) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
