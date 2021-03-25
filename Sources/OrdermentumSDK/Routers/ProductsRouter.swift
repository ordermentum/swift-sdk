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
    //Routes v1
    case getCategoryDirectory(String)
    case getProductDirectory(String, String)
    case getProductCategories(String, String, Int, Int)
    case getCategory(String, String, String)
    case getProduct(String, String, String)
    case getProducts(String, String, String, Bool, Int, Int)
    case getMostOrderedProducts(String, String, Bool, Int, Int)
    case getTrendingProducts(String, String, [String], Bool, Int, Int)
    case getRecommendedProducts(String, String, Int, [String])
    case searchProducts(String, String, String, Bool, Int)
    case getVariants(String, String)

    //Rputes v2
    case fetchProducts(String, ProductSearchRequest)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .fetchProducts:
            return .post
        default:
            return .get
        }
    }

    var version: String {
        switch self {
        case .fetchProducts:
            return "v2/"
        default:
            return "v1/"
        }
    }

    //Paths
    var path: String {
        switch self {
        case .getCategoryDirectory(let supplierId):
            return "directory/\(supplierId)/categories"
        case .getProductDirectory(let supplierId, _):
            return "directory/\(supplierId)/products"
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
        case .fetchProducts(let retailerId, _):
            return "products/\(retailerId)/search"
        case .getVariants(let purchaserId, let productId):
            return "purchasers/\(purchaserId)/products/\(productId)/variants"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getProductDirectory(_, let categoryId):
            return ["categoryId": categoryId]
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
        case .getTrendingProducts(let retailerId, let supplierId, let excluding, let visible, let pageSize, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "id__not": excluding, "visible": visible, "pageSize": pageSize, "pageNo": pageNo]
        case .getRecommendedProducts(let retailerId, let supplierId, let pageSize, let productsArray):
            return ["retailerId": retailerId, "supplierId": supplierId, "pageSize": pageSize, "id__not": productsArray]
        case .searchProducts(let search, let retailerId, let supplierId, let visible, let pageSize):
            return ["search": search, "retailerId": retailerId, "supplierId": supplierId, "visible": visible, "pageSize": pageSize]
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .fetchProducts(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version + path, method: method, parameters: parameters, body: body)
    }
}
