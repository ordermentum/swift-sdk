//
//  CreditNotesRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum CreditNotesRouter: URLRequestConvertible {
    //Routes
    case getCreditNotes(String, Int, Int)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getCreditNotes:
            return .get
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getCreditNotes:
            return "credit-notes"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getCreditNotes(let purchaserId, let pageSize, let pageNo):
            return ["purchaserId": purchaserId, "pageSize": pageSize, "pageNo": pageNo]
        default:
            return [:]
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