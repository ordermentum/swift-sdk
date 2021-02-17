//
//  OrdersRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 8/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum OrdersRouter: URLRequestConvertible {
    //Routes
    case submitOrder(CreateOrder)
    case submitStandingOrder(CreateStandingOrder)
    case getDeliveryDates(String, String)
    case getOrders(String, String, String, String, Int)
    case getVenueOrders(String, String, String, Int)
    case getOrdersByDeliveryDate(String, String, String)
    case removeFavourite(String)
    case getFavourites(String, String, String, String, Int)
    case getClassicStandingOrders(String, String, Bool, String)
    case updateOrderFirstTime(UpdateScheduleRequest)
    case updateOrder(String, UpdateOrderRequest)
    case createFavouriteOrder(CreateFavouriteRequest)
    case scheduleOrder(String, CreatePurchaserSchedule)
    case getInstalmentsURL(String)
    case reportIssue(ReportOrderIssueRequest)
    case resolveIssue(String, ResolveIssueRequest)
    case receiveOrder(String)
    case getActivity(String, String, String)

    //Methods
    var method: HTTPMethod {
        switch self {
        case .submitOrder:
            return .post
        case .submitStandingOrder:
            return .post
        case .getDeliveryDates:
            return .get
        case .getOrders:
            return .get
        case .getVenueOrders:
            return .get
        case .getOrdersByDeliveryDate:
            return .get
        case .removeFavourite:
            return .delete
        case .getFavourites:
            return .get
        case .getClassicStandingOrders:
            return .get
        case .updateOrderFirstTime:
            return .post
        case .updateOrder:
            return .put
        case .createFavouriteOrder:
            return .post
        case .scheduleOrder:
            return .put
        case .getInstalmentsURL:
            return .get
        case .reportIssue:
            return .post
        case .resolveIssue:
            return .post
        case .receiveOrder:
            return .post
        case .getActivity:
            return .get
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
        case .submitOrder:
            return "orders"
        case .submitStandingOrder:
            return "orders"
        case .getDeliveryDates:
            return "orders/delivery-dates"
        case .getOrders:
            return "orders"
        case .getVenueOrders:
            return "orders"
        case .getOrdersByDeliveryDate:
            return "orders"
        case .removeFavourite(let orderId):
            return "orders/\(orderId)"
        case .getFavourites:
            return "orders"
        case .getClassicStandingOrders:
            return "purchaser-schedules"
        case .updateOrderFirstTime:
            return "orders/purchaser-schedule"
        case .updateOrder(let orderId, _):
            return "orders/\(orderId)"
        case .createFavouriteOrder:
            return "orders"
        case .scheduleOrder(let scheduleId, _):
            return "purchaser-schedules/\(scheduleId)"
        case .getInstalmentsURL(let orderId):
            return "orders/\(orderId)/instalment"
        case .reportIssue:
            return "order-issues"
        case .resolveIssue(let orderId, _):
            return "orders/\(orderId)/resolve-issue"
        case .receiveOrder(let orderId):
            return "orders/\(orderId)/receive"
        case .getActivity:
            return "events"
        }
    }

    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .getDeliveryDates(let retailerId, let supplierId):
            return ["retailerId": retailerId, "supplierId": supplierId]
        case .getOrders(let retailerId, let supplierId, let sortBy, let sortOrder, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "sortBy[\(sortBy)]": sortOrder, "pageNo": pageNo]
        case .getVenueOrders(let retailerId, let sortBy, let sortOrder, let pageNo):
            return ["retailerId": retailerId, "sortBy[\(sortBy)]": sortOrder, "pageNo": pageNo]
        case .getOrdersByDeliveryDate(let retailerId, let supplierId, let sortBy):
            return ["retailerId": retailerId, "supplierId": supplierId, "sortBy[deliveryDate]": sortBy]
        case .getFavourites(let retailerId, let supplierId, let type, let sortBy, let pageNo):
            return ["retailerId": retailerId, "supplierId": supplierId, "type": type, "sortBy[name]": sortBy, "pageNo": pageNo]
        case .getClassicStandingOrders(let retailerId, let supplierId, let enabled, let sortBy):
            return ["retailerId": retailerId, "supplierId": supplierId, "standingOrdersEnabled": enabled, "sortBy": sortBy]
        case .getActivity(let supplierId, let orderId, let sortBy):
            return ["supplierId": supplierId, "entityId": orderId, "pageSize": 50, "pageNo": 1, "group": "orders", "sortBy[updatedAt]": sortBy]
        default:
            return [:]
        }
    }

    //Body
    var body: Codable? {
        switch self {
        case .submitOrder(let requestObject):
            return requestObject
        case .submitStandingOrder(let requestObject):
            return requestObject
        case .updateOrderFirstTime(let requestObject):
            return requestObject
        case .updateOrder(_, let requestObject):
            return requestObject
        case .createFavouriteOrder(let requestObject):
            return requestObject
        case .scheduleOrder(_, let requestObject):
            return requestObject
        case .reportIssue(let requestObject):
            return requestObject
        case .resolveIssue(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }

    //Timeout
    var timeout: Int {
        switch self {
        case .submitOrder:
            return 120
        default:
            return 10
        }
    }

    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body, timeout: timeout)
    }
}
