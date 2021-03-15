//
//  ProjectionsService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 9/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class ProjectionsService {
    public init() { }

    /**
     * Fetch an array of projections belonging to a retailer/supplier relationship
     * startDate must be set in the following format: yyyy-MM-dd'T'HH:mm:ss.SSS'Z
     * timezone must be set using long form timezones, example: "Australia/Sydney"
     * Returns ProjectionResponse
     */
    public func getProjections(purchaserId: String, startDate: String, timezone: String, completion: @escaping (Bool, ProjectionsResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProjectionsRouter.getProjections(purchaserId, startDate, timezone) as URLRequestConvertible

        //Call API
        Service<ProjectionsResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch a single order belonging to a Projection object
     * Returns an Order
     */
    public func getOrder(orderId: String, completion: @escaping (Bool, Order?, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProjectionsRouter.getOrder(orderId) as URLRequestConvertible

        //Call API
        Service<Order, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Cancel a single order
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    public func cancelOrder(purchaserScheduleId: String, date: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProjectionsRouter.cancelOrder(purchaserScheduleId, date) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Cancel all orders belonging to a given PurchaserScheduleId
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    public func deleteOrder(purchaserScheduleId: String, requestObject: ProjectionDeleteRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProjectionsRouter.deleteOrder(purchaserScheduleId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Reinstates a cancelled order
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    public func reinstateOrder(purchaserScheduleId: String, requestObject: ProjectionReinstateRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = ProjectionsRouter.reinstateOrder(purchaserScheduleId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
