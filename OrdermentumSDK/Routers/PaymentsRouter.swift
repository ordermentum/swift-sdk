//
//  PaymentsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum PaymentsRouter: URLRequestConvertible {
    //Routes
    case getPaymentMethods(String)
    case getSinglePaymentMethod(String, String)
    case createCardPaymentMethod(String, CreateCardPaymentMethodRequest)
    case createDebitPaymentMethod(String, CreateDirectDebitPaymentMethodRequest)
    case deletePaymentMethod(String, String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getPaymentMethods:
            return .get
        case .getSinglePaymentMethod:
            return .get
        case .createCardPaymentMethod:
            return .post
        case .createDebitPaymentMethod:
            return .post
        case .deletePaymentMethod:
            return .delete
        }
    }
    
    var version: String {
        switch self {
        default:
            return "v1/"
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getPaymentMethods(let retailerId):
            return "retailers/\(retailerId)/payment-methods"
        case .getSinglePaymentMethod(let retailerId, let paymentMethodId):
            return "retailers/\(retailerId)/payment-methods/\(paymentMethodId)"
        case .createCardPaymentMethod(let retailerId, _):
            return "retailers/\(retailerId)/payment-methods"
        case .createDebitPaymentMethod(let retailerId, _):
            return "retailers/\(retailerId)/payment-methods"
        case .deletePaymentMethod(let retailerId, let paymentMethodId):
            return "retailers/\(retailerId)/payment-methods/\(paymentMethodId)"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .createCardPaymentMethod(_, let requestObject):
            return requestObject
        case .createDebitPaymentMethod(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
