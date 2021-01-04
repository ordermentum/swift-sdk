//
//  FindSupplierRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum FindSupplierRouter: URLRequestConvertible {
    //Routes
    case getSuppliers(String, Int, String)
    case sendSupplierEnquiry(FindSupplierRequest)
    case sendSupplierReferral(FindSupplierReferralRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getSuppliers:
            return .get
        case .sendSupplierEnquiry:
            return .post
        case .sendSupplierReferral:
            return .post
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
        case .getSuppliers:
            return "suppliers/directory"
        case .sendSupplierEnquiry:
            return "suppliers/enquiry"
        case .sendSupplierReferral:
            return "suppliers/referral"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getSuppliers(let searchString, let pageSize, let retailerId):
            return ["search": searchString, "pageSize": pageSize, "retailerId": retailerId]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .sendSupplierEnquiry(let requestObject):
            return requestObject
        case .sendSupplierReferral(let requestObject):
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
