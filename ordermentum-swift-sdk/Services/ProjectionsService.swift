//
//  ProjectionsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class ProjectionsService {
    /**
     * Fetch an array of projections belonging to a retailer/supplier relationship
     * startDate must be set in the following format: yyyy-MM-dd'T'HH:mm:ss.SSS'Z
     * timezone must be set using long form timezones, example: "Australia/Sydney"
     * Returns ProjectionResponse
     */
    func getProjections(purchaserId: String, startDate: String, timezone: String, completion: @escaping (Bool, ProjectionsResponse?) -> ()) {
        //Build Route
        let route = ProjectionsRouter.getProjections(purchaserId, startDate, timezone) as URLRequestConvertible
        
        //Call API
        Service<ProjectionsResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch a single order belonging to a Projection object
     * Returns an Order
     */
    func getOrder(orderId: String, completion: @escaping (Bool, Order?) -> ()) {
        //Build Route
        let route = ProjectionsRouter.getOrder(orderId) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Cancel a single order
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    func cancelOrder(purchaserScheduleId:String, date: String, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = ProjectionsRouter.cancelOrder(purchaserScheduleId, date) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Cancel all orders belonging to a given PurchaserScheduleId
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    func deleteOrder(purchaserScheduleId: String, requestObject: ProjectionDeleteRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = ProjectionsRouter.deleteOrder(purchaserScheduleId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Reinstates a cancelled order
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    func reinstateOrder(purchaserScheduleId: String, requestObject: ProjectionReinstateRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = ProjectionsRouter.reinstateOrder(purchaserScheduleId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
