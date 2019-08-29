//
//  ProductsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ProductsRouter: URLRequestConvertible {
    //Routes
    case getProductCategories(String, String, Int, Int)
    case getCategory(String, String, String)
    case getProduct(String, String, String)
    case getProducts(String, String, String, Bool, Int, Int)
    case getMostOrderedProducts(String, String, Bool, Int, Int)
    case getTrendingProducts(String, String, Bool, Int, Int)
    case getRecommendedProducts(String, String, Int, [String])
    case searchProducts(String, String, String, Bool, Int)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getProductCategories:
            return .get
        case .getCategory:
            return .get
        case .getProduct:
            return .get
        case .getProducts:
            return .get
        case .getMostOrderedProducts:
            return .get
        case .getTrendingProducts:
            return .get
        case .getRecommendedProducts:
            return .get
        case .searchProducts:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getProductCategories:
            return "categories"
        case .getCategory(let categoryId, _, _):
            return "categories/\(categoryId)"
        case .getProduct(let productId, _, _):
            return "products/\(productId)"
        case .getProducts:
            return "products"
        case .getMostOrderedProducts:
            return "products/most-ordered"
        case .getTrendingProducts:
            return "products/trending"
        case .getRecommendedProducts:
            return "products/recommendations"
        case .searchProducts:
            return "products"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getProductCategories(let retailerId, let supplierId, let pageSize, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "pageSize": pageSize, "pageNo": pageNo]
        case .getCategory(_, let supplierId, let retailerId):
            return ["retailerId": retailerId, "supplierId": supplierId]
        case .getProduct(_, let retailerId, let supplierId):
            return ["retailerId": retailerId, "supplierId": supplierId]
        case .getProducts(let categoryId, let retailerId, let supplierId, let visible, let pageSize, let pageNo):
            return ["categoryId": categoryId, "retailerId": retailerId, "supplierId": supplierId, "visible": visible, "pageSize": pageSize, "pageNo": pageNo]
        case .getMostOrderedProducts(let retailerId, let supplierId, let visible, let pageSize, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "visible": visible, "pageSize": pageSize, "pageNo": pageNo]
        case .getTrendingProducts(let retailerId, let supplierId, let visible, let pageSize, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "visible": visible, "pageSize": pageSize, "pageNo": pageNo]
        case .getRecommendedProducts(let retailerId, let supplierId, let pageSize, let productsArray):
            return ["retailerId": retailerId, "supplierId": supplierId, "pageSize": pageSize, "id__not": productsArray]
        case .searchProducts(let search, let retailerId, let supplierId, let visible, let pageSize):
            return ["search": search, "retailerId": retailerId, "supplierId": supplierId, "visible": visible, "pageSize": pageSize]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
