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
     * Fetch the category directory for a supplier that a retailer is not connected to.
     * Returns a CategoryResponse object
     */
    public func getCategoryDirectory(supplierId: String, completion: @escaping (Bool, CategoryResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getCategoryDirectory(supplierId) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the product directory for a supplier that a retailer is not connected to.
     * Returns a ProductResponse object
     */
    public func getProductDirectory(supplierId: String, categoryId: String, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getProductDirectory(supplierId, categoryId) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the product categories for a particular supplier-retailer relationship
     * Returns a Category object
     */
    public func getProductCategories(retailerId: String, supplierId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, CategoryResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getProductCategories(retailerId, supplierId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single category for a particular categoryId and supplier-retailer relationship
     * Returns a Category object
     */
    public func getCategory(categoryId: String, retailerId: String, supplierId: String, completion: @escaping (Bool, CategoryResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getCategory(categoryId, retailerId, supplierId ) as URLRequestConvertible
        
        //Call API
        Service<CategoryResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the products belonging to a particular category
     * Returns a ProductResponse object
     */
    public func getProducts(categoryId: String, retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getProducts(categoryId, retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch a single product by ID
     * Returns a Product object
     */
    public func getProduct(productId: String, retailerId: String, supplierId: String, completion: @escaping (Bool, Product?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getProduct(productId, retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<Product, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the most ordered products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getMostOrderedProducts(retailerId: String, supplierId: String, visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getMostOrderedProducts(retailerId, supplierId, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the trending products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getTrendingProducts(retailerId: String, supplierId: String, excluding: [String], visible: Bool, pageSize: Int, pageNo: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getTrendingProducts(retailerId, supplierId, excluding, visible, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the recommended products belonging to a particular supplier/retailer relationship
     * Returns a ProductResponse object
     */
    public func getRecommendedProducts(retailerId: String, supplierId: String, pageSize: Int, excludedProductIdsArray: [String], completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getRecommendedProducts(retailerId, supplierId, pageSize, excludedProductIdsArray) as URLRequestConvertible

        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Search for products
     * Returns a list of ProductResponse
     */
    public func searchProducts(search: String, retailerId: String, supplierId: String, visible: Bool, pageSize: Int, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.searchProducts(search, retailerId, supplierId, visible, pageSize) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch for products
     * Accepts: retailerId string and ProductSearchRequest obj
     * Returns a ProductResponse object
     */
    public func fetchProducts(retailerId: String, requestObject: ProductSearchRequest, completion: @escaping (Bool, ProductResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.fetchProducts(retailerId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<ProductResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /// GET's the variants associated to a product. Will always retrun at least one variant even if product does not have variants setup, being the product itself represented as a variant.
    /// - Parameters:
    ///   - purchaserId: The purchaser id that should be used to fetch variants
    ///   - productId: The id of the product that should be used to fetch variants
    ///   - completion: Async callback containing result, response and error objects.
    public func getVariants(purchaserId: String, productId: String, completion: @escaping (Bool, VariantsResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProductsRouter.getVariants(purchaserId, productId) as URLRequestConvertible
        
        //Call API
        Service<VariantsResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
