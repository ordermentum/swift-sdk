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
    case getNotification(String)
    case readNotification(String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .updateNotificationSetting:
            return .post
        case .updateAllNotificationSettings:
            return .post
        case .getNotification:
            return .get
        case .readNotification:
            return .patch
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .updateNotificationSetting(let userId, let supplierId, _):
            return "users/\(userId)/notifications/\(supplierId)"
        case .updateAllNotificationSettings(let userId, _):
            return "users/\(userId)/notifications"
        case .getNotification:
            return "notifications"
        case .readNotification(let notificationId):
            return "notifications/\(notificationId)/read"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getNotification(let userId):
            return ["userId": userId]
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
        case .getNotification(let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        switch self {
        case .getNotification, .readNotification:
            return try NotificationsClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
        default:
            return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
        }
    }
}
