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
    /**
     * Fetch the product categories for a particular supplier-retailer relationship
     * Returns a Category object
     */
    func getProductCategories(retailerId: String, supplierId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, CategoryResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getProductCategories(retailerId, supplierId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the products belonging to a particular category
     * Returns a Product object
     */
    func getProducts(categoryId: String, retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getProducts(categoryId, retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the most ordered products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    func getMostOrderedProducts(retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getMostOrderedProducts(retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the trending products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    func getTrendingProducts(retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getTrendingProducts(retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the recommended products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    func getRecommendedProducts(retailerId: String, supplierId: String, pageSize: Int, excludedProductIdsArray: [String], completion: @escaping (Bool, ProductResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.getRecommendedProducts(retailerId, supplierId, pageSize, excludedProductIdsArray) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Search for products
     * Returns a list of ProductResponse
     */
    func searchProducts(search: String, supplierId: String, visible: Bool, pageSize: Int, completion: @escaping (Bool, ProductResponse?) -> ()) {
        //Build Route
        let route = ProductsRouter.searchProducts(search, supplierId, visible, pageSize) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
}
