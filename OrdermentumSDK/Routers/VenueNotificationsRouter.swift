//
//  VenueNotificationsRouter.swift
//
//  Created by Joseph Fabian on 7/8/20.
//

import Foundation
import Alamofire

public enum VenueNotificationsRouter: URLRequestConvertible {
    //Routes
    case getNotifications(String)
    case markNotificationAsRead(String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .getNotifications:
            return .get
        case .markNotificationAsRead:
            return .patch
        }
    }

    //Paths
    var path: String {
        switch self {
        case .getNotifications:
            return "notifications"
        case .markNotificationAsRead(let notificationId):
            return "notifications/\(notificationId)/read"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getNotifications(let userId):
            return ["userId": userId]
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .getNotifications(let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        switch self {
        default:
            return try NotificationsClient.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
        }
    }
}
