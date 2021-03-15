//
//  ClosurePeriodsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ClosurePeriodsRouter: URLRequestConvertible {
    //Routes
    case getClosurePeriods(String, Int, Int)
    case createClosurePeriod(ClosurePeriod)
    case updateClosurePeriod(String, ClosurePeriod)
    case deleteClosurePeriod(String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getClosurePeriods:
            return .get
        case .createClosurePeriod:
            return .post
        case .updateClosurePeriod:
            return .put
        case .deleteClosurePeriod:
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
        case .getClosurePeriods:
            return "closure-periods"
        case .createClosurePeriod:
            return "closure-periods"
        case .updateClosurePeriod(let closurePeriodId, _):
            return "closure-periods/\(closurePeriodId)"
        case .deleteClosurePeriod(let closurePeriodId):
            return "closure-periods/\(closurePeriodId)"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getClosurePeriods(let retailerId, let pageSize, let pageNo):
            return ["retailerId": retailerId, "pageSize": pageSize, "pageNo": pageNo]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .createClosurePeriod(let requestObject):
            return requestObject
        case .updateClosurePeriod(_, let requestObject):
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
