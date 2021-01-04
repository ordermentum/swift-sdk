//
//  NotificationsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum NotificationsRouter: URLRequestConvertible {
    //Routes
    case updateNotificationSetting(String, String, [String: Bool])
    case updateAllNotificationSettings(String, SupplierNotifications)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .updateNotificationSetting:
            return .post
        case .updateAllNotificationSettings:
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
        case .updateNotificationSetting(let userId, let supplierId, _):
            return "users/\(userId)/notifications/\(supplierId)"
        case .updateAllNotificationSettings(let userId, _):
            return "users/\(userId)/notifications"
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
        case .updateNotificationSetting(_, _, let requestObject):
            return requestObject
        case .updateAllNotificationSettings(_, let requestObject):
            return requestObject
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
