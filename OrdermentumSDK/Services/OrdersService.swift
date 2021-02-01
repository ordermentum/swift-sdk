//
//  OrdersService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class OrdersService {
    public init() { }

    /**
     * Create an order for a retailer
     * Returns an Order
     */
    public func submitOrder(_ requestObject: CreateOrder, completion: @escaping (Bool, Order?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.submitOrder(requestObject) as URLRequestConvertible

        //Call API
        Service<Order, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Create an order for a retailer
     * Returns an Order
     */
    public func submitStandingOrder(_ requestObject: CreateStandingOrder, completion: @escaping (Bool, Order?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.submitStandingOrder(requestObject) as URLRequestConvertible

        //Call API
        Service<Order, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch the delivery dates for a particular retailer/supplier relationship
     * Returns an array of Strings
     */
    public func getDeliveryDates(retailerId: String, supplierId: String, completion: @escaping (Bool, [String]?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getDeliveryDates(retailerId, supplierId) as URLRequestConvertible

        //Call API
        Service<[String], Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch an array of orders belonging to a retailer
     * Returns an array of Orders
     */
    public func getOrders(retailerId: String, sortBy: String, sortOrder: String, pageNo: Int, completion: @escaping (Bool, OrderResponse?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getVenueOrders(retailerId, sortBy, sortOrder, pageNo) as URLRequestConvertible

        //Call API
        Service<OrderResponse, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch an array of orders belonging to a retailer/supplier relationship
     * Returns an array of Orders
     */
    public func getOrders(retailerId: String, supplierId: String, sortBy: String, sortOrder: String, pageNo: Int, completion: @escaping (Bool, OrderResponse?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getOrders(retailerId, supplierId, sortBy, sortOrder, pageNo) as URLRequestConvertible

        //Call API
        Service<OrderResponse, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch an array of orders belonging to a retailer/supplier relationship sorted by delivery date
     * Returns an array of Orders
     */
    public func getOrdersByDeliveryDate(retailerId: String, supplierId: String, sortBy: String, completion: @escaping (Bool, OrderResponse?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getOrdersByDeliveryDate(retailerId, supplierId, sortBy) as URLRequestConvertible

        //Call API
        Service<OrderResponse, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Remove a favourite order from a logged in user
     * Returns a ResponseBody which can be used to check for a 200 Response code
     */
    public func removeFavourite(orderId: String, completion: @escaping (Bool, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.removeFavourite(orderId) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, Validation>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Fetch an array of favourite orders belonging to a retailer/supplier relationship
     * To retrieve a users favourites 'template' should be passed in as the 'type' parameter
     * Returns an array of Orders
     */
    public func getFavourites(retailerId: String, supplierId: String, type: String, sortBy: String, pageNo: Int, completion: @escaping (Bool, OrderResponse?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getFavourites(retailerId, supplierId, type, sortBy, pageNo) as URLRequestConvertible

        //Call API
        Service<OrderResponse, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Fetch an array of classic standing orders belonging to a retailer/supplier relationship
     * To retrieve a users classic orders true should be passed in as the 'standingOrdersEnabled' parameter
     * Ideally, but optionally, sortBy should have its value set to 'nextRunAt'
     * Returns an ClassicStandingOrderResponse
     */
    public func getClassicStandingOrders(retailerId: String, supplierId: String, enabled: Bool, sortBy: String, completion: @escaping (Bool, ClassicStandingOrderResponse?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.getClassicStandingOrders(retailerId, supplierId, enabled, sortBy) as URLRequestConvertible

        //Call API
        Service<ClassicStandingOrderResponse, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Update an order for the first time
     * Returns a ResponseBody
     */
    public func updateOrderFirstTime(_ requestObject: UpdateScheduleRequest, completion: @escaping (Bool, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.updateOrderFirstTime(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, Validation>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Update an order, not for the first time. To update an order for the first time use 'updateScheduledOrder'
     * Check if an order has been edited by checking if the type equals scheduled-edited
     * Returns a ResponseBody
     */
    public func updateOrder(orderId: String, requestObject: UpdateOrderRequest, completion: @escaping (Bool, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.updateOrder(orderId, requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, Validation>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    public func createFavourite(_ requestObject: CreateFavouriteRequest, completion: @escaping (Bool, Order?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.createFavouriteOrder(requestObject) as URLRequestConvertible

        //Call API
        Service<Order, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    public func scheduleOrder(purchaserScheduleId: String, requestObject: CreatePurchaserSchedule, completion: @escaping (Bool, ClassicStandingOrder?, Validation?) -> Void) {
        //Build Route
        let route = OrdersRouter.scheduleOrder(purchaserScheduleId, requestObject) as URLRequestConvertible

        //Call API
        Service<ClassicStandingOrder, Validation>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Get the URL that a user should be redirected to when placing an order on finance
     * Returns a String
     */
    public func getInstalmentsURL(orderId: String, completion: @escaping (Bool, InstalmentsResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = OrdersRouter.getInstalmentsURL(orderId) as URLRequestConvertible

        //Call API
        Service<InstalmentsResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Report an issue to a supplier that a retailer has with an order
     * Returns a ResponseBody
     */
    public func reportIssue(requestObject: ReportOrderIssueRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = OrdersRouter.reportIssue(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Report to a supplier that a retailer has received an order without issue.
     * Returns a ResponseBody
     */
    public func receiveOrder(orderId: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = OrdersRouter.receiveOrder(orderId) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Retrieves the 50 most recent activity events on an order.
     * Returns an ActivityResponse object.
     */
    public func getActivity(supplierId: String, orderId: String, sortBy: String = "-1", completion: @escaping (Bool, ActivityResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = OrdersRouter.getActivity(supplierId, orderId, sortBy) as URLRequestConvertible

        //Call API
        Service<ActivityResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
