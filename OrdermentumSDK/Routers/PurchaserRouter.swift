//
//  PurchaserRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum PurchaserRouter: URLRequestConvertible {
    //Routes
    case getPurchasers(String, String)
    case getPurchasersForPaymentMethod(String, String)
    case updatePaymentMethod(String, UpdatePaymentMethodRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getPurchasers:
            return .get
        case .getPurchasersForPaymentMethod:
            return .get
        case .updatePaymentMethod:
            return .put
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getPurchasers:
            return "purchasers"
        case .getPurchasersForPaymentMethod:
            return "purchasers"
        case .updatePaymentMethod(let purchaserId, _):
            return "purchasers/\(purchaserId)/payment-method"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getPurchasers(let retailerId, let supplierId):
            return ["retailerId": retailerId, "supplierId": supplierId, "disabled": false]
        case .getPurchasersForPaymentMethod(let retailerId, let paymentMethodType):
            return ["retailerId": retailerId, "paymentMethodType": paymentMethodType, "disabled": false]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .updatePaymentMethod(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
