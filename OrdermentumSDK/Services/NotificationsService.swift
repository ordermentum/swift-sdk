//
//  NotificationsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class NotificationsService {
    public init() {}
    
    /**
     * Update a particular notification setting for a supplier to retailer relationship
     * Returns a ResponseBody
     */
    public func updateNotificationSetting(userId: String, supplierId: String, updateObject: [String: Bool], completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = NotificationsRouter.updateNotificationSetting(userId, supplierId, updateObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Update all notification settings for all suppliers across all venues
     * Returns a ResponseBody
     */
    public func updateAllNotificationSettings(userId: String, updateObject: SupplierNotifications, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = NotificationsRouter.updateAllNotificationSettings(userId, updateObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }

    public func getNotification(userId: String, completion: @escaping (Bool, VenueNotificationsResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueNotificationsRouter.getNotifications(userId) as URLRequestConvertible

        //Call API
        Service<VenueNotificationsResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    public func readNotification(notificationId: String, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = VenueNotificationsRouter.markNotificationAsRead(notificationId) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }

}
