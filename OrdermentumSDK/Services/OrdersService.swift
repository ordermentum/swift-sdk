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
    public init() {}
    
    /**
     * Create an order for a retailer
     * Returns an Order
     */
    public func submitOrder(_ requestObject: CreateOrder, completion: @escaping (Bool, Order?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.submitOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Create an order for a retailer
     * Returns an Order
     */
    public func submitStandingOrder(_ requestObject: CreateStandingOrder, completion: @escaping (Bool, Order?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.submitStandingOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch the delivery dates for a particular retailer/supplier relationship
     * Returns an array of Strings
     */
    public func getDeliveryDates(retailerId: String, supplierId: String, completion: @escaping (Bool, [String]?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getDeliveryDates(retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<[String]>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch an array of orders belonging to a retailer/supplier relationship
     * Returns an array of Orders
     */
    public func getOrders(retailerId: String, supplierId: String, sortBy: String, completion: @escaping (Bool, OrderResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getOrders(retailerId, supplierId, sortBy) as URLRequestConvertible
        
        //Call API
        Service<OrderResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch an array of orders belonging to a retailer/supplier relationship sorted by delivery date
     * Returns an array of Orders
     */
    public func getOrdersByDeliveryDate(retailerId: String, supplierId: String, sortBy: String, completion: @escaping (Bool, OrderResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getOrdersByDeliveryDate(retailerId, supplierId, sortBy) as URLRequestConvertible
        
        //Call API
        Service<OrderResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Remove a favourite order from a logged in user
     * Returns a ResponseBody which can be used to check for a 200 Response code
     */
    public func removeFavourite(orderId: String, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.removeFavourite(orderId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Fetch an array of favourite orders belonging to a retailer/supplier relationship
     * To retrieve a users favourites 'template' should be passed in as the 'type' parameter
     * Returns an array of Orders
     */
    public func getFavourites(retailerId: String, supplierId: String, type: String, sortBy: String, pageNo: Int, completion: @escaping (Bool, OrderResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getFavourites(retailerId, supplierId, type, sortBy, pageNo) as URLRequestConvertible
        
        //Call API
        Service<OrderResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Fetch an array of classic standing orders belonging to a retailer/supplier relationship
     * To retrieve a users classic orders true should be passed in as the 'standingOrdersEnabled' parameter
     * Ideally, but optionally, sortBy should have its value set to 'nextRunAt'
     * Returns an ClassicStandingOrderResponse
     */
    public func getClassicStandingOrders(retailerId: String, supplierId: String, enabled: Bool, sortBy: String, completion: @escaping (Bool, ClassicStandingOrderResponse?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getClassicStandingOrders(retailerId, supplierId, enabled, sortBy) as URLRequestConvertible
        
        //Call API
        Service<ClassicStandingOrderResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Update an order for the first time
     * Returns a ResponseBody
     */
    public func updateOrderFirstTime(_ requestObject: UpdateScheduleRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.updateOrderFirstTime(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Update an order, not for the first time. To update an order for the first time use 'updateScheduledOrder'
     * Check if an order has been edited by checking if the type equals scheduled-edited
     * Returns a ResponseBody
     */
    public func updateOrder(orderId: String, requestObject: UpdateOrderRequest, completion: @escaping (Bool, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.updateOrder(orderId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, errorObject)
        }
    }
    
    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    public func createFavourite(_ requestObject: CreateFavouriteRequest, completion: @escaping (Bool, Order?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.createFavouriteOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
    
    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    public func scheduleOrder(purchaserScheduleId: String, requestObject: CreatePurchaserSchedule, completion: @escaping (Bool, ClassicStandingOrder?, ErrorResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.scheduleOrder(purchaserScheduleId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<ClassicStandingOrder>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
