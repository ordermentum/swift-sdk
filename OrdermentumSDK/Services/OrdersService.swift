//
//  OrdersService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class OrdersService {
    /**
     * Create an order for a retailer
     * Returns an Order
     */
    func submitOrder(requestObject: CreateOrder, completion: @escaping (Bool, Order?) -> ()) {
        //Build Route
        let route = OrdersRouter.submitOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Create an order for a retailer
     * Returns an Order
     */
    func submitStandingOrder(requestObject: CreateStandingOrder, completion: @escaping (Bool, Order?) -> ()) {
        //Build Route
        let route = OrdersRouter.submitStandingOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch the delivery dates for a particular retailer/supplier relationship
     * Returns an array of Strings
     */
    func getDeliveryDates(retailerId: String, supplierId: String, completion: @escaping (Bool, [String]?) -> ()) {
        //Build Route
        let route = OrdersRouter.getDeliveryDates(retailerId, supplierId) as URLRequestConvertible
        
        //Call API
        Service<[String]>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch an array of orders belonging to a retailer/supplier relationship
     * Returns an array of Orders
     */
    func getOrders(retailerId: String, supplierId: String, sortBy: String, completion: @escaping (Bool, OrderResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getOrders(retailerId, supplierId, sortBy) as URLRequestConvertible
        
        //Call API
        Service<OrderResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Remove a favourite order from a logged in user
     * Returns a ResponseBody which can be used to check for a 200 Response code
     */
    func removeFavourite(orderId: String, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = OrdersRouter.removeFavourite(orderId) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Fetch an array of favourite orders belonging to a retailer/supplier relationship
     * To retrieve a users favourites 'template' should be passed in as the 'type' parameter
     * Returns an array of Orders
     */
    func getFavourites(retailerId: String, supplierId: String, type: String, sortBy: String, pageNo: Int, completion: @escaping (Bool, OrderResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getFavourites(retailerId, supplierId, type, sortBy, pageNo) as URLRequestConvertible
        
        //Call API
        Service<OrderResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Fetch an array of classic standing orders belonging to a retailer/supplier relationship
     * To retrieve a users classic orders true should be passed in as the 'standingOrdersEnabled' parameter
     * Ideally, but optionally, sortBy should have its value set to 'nextRunAt'
     * Returns an ClassicStandingOrderResponse
     */
    func getClassicStandingOrders(retailerId: String, supplierId: String, enabled: Bool, sortBy: String, completion: @escaping (Bool, ClassicStandingOrderResponse?) -> ()) {
        //Build Route
        let route = OrdersRouter.getClassicStandingOrders(retailerId, supplierId, enabled, sortBy) as URLRequestConvertible
        
        //Call API
        Service<ClassicStandingOrderResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Update an order for the first time
     * Returns a ResponseBody
     */
    func updateOrderFirstTime(requestObject: UpdateScheduleRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = OrdersRouter.updateOrderFirstTime(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Update an order, not for the first time. To update an order for the first time use 'updateScheduledOrder'
     * Check if an order has been edited by checking if the type equals scheduled-edited
     * Returns a ResponseBody
     */
    func updateOrder(orderId: String, requestObject: UpdateOrderRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = OrdersRouter.updateOrder(orderId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    func createFavourite(requestObject: CreateFavouriteRequest, completion: @escaping (Bool, Order?) -> ()) {
        //Build Route
        let route = OrdersRouter.createFavouriteOrder(requestObject) as URLRequestConvertible
        
        //Call API
        Service<Order>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Add an order to a users favourite orders
     * Returns an Order
     */
    func scheduleOrder(purchaserScheduleId: String, requestObject: CreatePurchaserSchedule, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = OrdersRouter.scheduleOrder(purchaserScheduleId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
