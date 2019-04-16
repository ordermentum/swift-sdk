//
//  ExperimentsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ExperimentsRouter: URLRequestConvertible {
    //Routes
    case getExperiments(String, String, String, String, Bool, String, [String])
    case dismissExperiment(ExperimentsDismissRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getExperiments:
            return .get
        case .dismissExperiment:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getExperiments:
            return "experiments/discover"
        case .dismissExperiment:
            return "experiments/dismiss"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getExperiments(let slot, let source, let version, let retailerId, let isRetailer, let userId, let supplierId):
            return ["slot": slot, "source": source, "version": version, "retailerId": retailerId, "isRetailer": isRetailer, "userId": userId, "supplierId[]": supplierId]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .dismissExperiment(let requestObject):
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