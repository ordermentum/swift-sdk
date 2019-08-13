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
    case getExperiment(String)
    case getExperiments(String, String, String, String, Bool, String, String, [String], String)
    case dismissExperiment(ExperimentsDismissRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getExperiment:
            return .get
        case .getExperiments:
            return .get
        case .dismissExperiment:
            return .post
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .getExperiment(let experimentId):
            return "experiments/\(experimentId)"
        case .getExperiments:
            return "experiments/discover"
        case .dismissExperiment:
            return "experiments/dismiss"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getExperiments(let slot, let source, let version, let retailerId, let isRetailer, let userId, let purchaserId, let supplierId, let model):
            return ["slot": slot, "source": source, "version": version, "retailerId": retailerId, "isRetailer": isRetailer, "userId": userId, "purchaserId": purchaserId, "supplierId": supplierId, "model": model]
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
        return try FlagsClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
