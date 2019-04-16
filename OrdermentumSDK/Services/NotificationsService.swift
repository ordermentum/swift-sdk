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
    /**
     * Update a particular notification setting for a supplier to retailer relationship
     * Returns a ResponseBody
     */
    func updateNotificationSetting(userId: String, supplierId: String, updateObject: [String: Bool], completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = NotificationsRouter.updateNotificationSetting(userId, supplierId, updateObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
