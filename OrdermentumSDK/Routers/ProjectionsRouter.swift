//
//  ProjectionsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum ProjectionsRouter: URLRequestConvertible {
    //Routes
    case getProjections(String, String, String)
    case getOrder(String)
    case cancelOrder(String, String)
    case deleteOrder(String, ProjectionDeleteRequest)
    case reinstateOrder(String, ProjectionReinstateRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .getProjections:
            return .get
        case .getOrder:
            return .get
        case .cancelOrder:
            return .delete
        case .deleteOrder:
            return .put
        case .reinstateOrder:
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
        case .getProjections:
            return "projections"
        case .getOrder(let orderId):
            return "orders/\(orderId)"
        case .cancelOrder(let purchaserScheduleId, _):
            return "purchaser-schedules/\(purchaserScheduleId)/run"
        case .deleteOrder(let purchaserScheduleId, _):
            return "purchaser-schedules/\(purchaserScheduleId)"
        case .reinstateOrder(let purchaserScheduleId, _):
            return "purchaser-schedules/\(purchaserScheduleId)/run"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getProjections(let purchaserId, let startDate, let timezone):
            return ["purchaserId": purchaserId, "startDate": startDate, "timezone": timezone]
        case .cancelOrder(_, let date):
            return ["date": date]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .deleteOrder(_, let requestObject):
                return requestObject
        case .reinstateOrder(_, let requestObject):
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
