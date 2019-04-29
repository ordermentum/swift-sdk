//
//  NetworkStub.swift
//  OrdermentumSDKTests
//
//  Created by Mark Kenneth Bayona on 17/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Hippolyte

public enum StubDataFile: String {
    case addonsSearch
    case addonsSearchError = "jsonError"
    case getPurchasers
    case getPurchasersError = "GetPurchasers_jsonError"
    case getPurchaserForPaymentMethod
    case updatePaymentMethod
    case getProfile
    case updateProfile
    case getMarketPlaces
    case getProductCategories
    case getProduct
    case getMostOrderedProducts
    case getTrendingProducts
    case getRecommendedProducts
    case searchProducts
    case getPaymentMethods
    case getSinglePaymentMethods
    case createCardPaymentMethod
    case deletePaymentMethod
    case getNPS
    case sendFeedback
    case registerDevice
    case notificationSettingsUpdate
  
    //Orders
    case submitOrder
    case submitStandingOrder
    case getDeliveryDates
    case getOrders
    case removeFavourite
    case getFavourites
    case getClassicStandingOrders
    case getClassicStandingOrders_Empty
    case updateOrderFirstTime
    case updateOrder
    case createFavourite
    case scheduleOrder
    
    //Invoices
    case getInvoices
    case exportInvoice
    case downloadInvoice
    case applyPayment
}

protocol NetworkStubs {
}

extension NetworkStubs {
    func startStub(_ route: URLRequest, bodyJSONString: String) {
        if let url = route.url, let methodString = route.httpMethod, let method = HTTPMethod(rawValue: methodString) {
            var stub = StubRequest(method: method, url: url)
            var response = StubResponse()
            let body = bodyJSONString.data(using: .utf8)!
            response.body = body
            stub.response = response
            Hippolyte.shared.add(stubbedRequest: stub)
            Hippolyte.shared.start()
        }
    }
    
    func startStub(_ route: URLRequest, stubData: StubDataFile) {
        if let url = route.url, let methodString = route.httpMethod, let method = HTTPMethod(rawValue: methodString) {
            
            var stub = StubRequest(method: method, url: url)
            var response = StubResponse()
            
            if let fileUrl = Bundle(identifier: "io.ordermentum.OrdermentumSDKTests")!.url(forResource: stubData.rawValue, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileUrl)
                    response.body = data
                } catch {
                    print("error:\(error)")
                }
            }
            stub.response = response
            Hippolyte.shared.add(stubbedRequest: stub)
            Hippolyte.shared.start()
        }
    }
}

extension AddOnsServiceTests: NetworkStubs {}
extension NotifyServiceTests: NetworkStubs {}
extension NPSServiceTests: NetworkStubs {}

extension ProfileServiceTest: NetworkStubs {}
extension MarketplaceServiceTests: NetworkStubs {}
extension ProductsServiceTests: NetworkStubs {}
extension PaymentsServiceTests: NetworkStubs {}
extension PurchaserServiceTests: NetworkStubs {}
extension NotificationServiceTests: NetworkStubs {}
extension InvoiceServiceTests: NetworkStubs {}
