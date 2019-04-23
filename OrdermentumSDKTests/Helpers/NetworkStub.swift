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
    case AddonsSearch
    case AddonsSearchError = "jsonError"
    case GetPurchasers
    case GetPurchasersError = "GetPurchasers_jsonError"
    case GetPurchaserForPaymentMethod
    case UpdatePaymentMethod
    case GetProfile
    case UpdateProfile
    case GetMarketPlaces
    case GetProductCategories
    case GetProduct
    case GetMostOrderedProducts
    case GetTrendingProducts
    case GetRecommendedProducts
    case SearchProducts
    case GetPaymentMethods
    case GetSinglePaymentMethods
    case CreateCardPaymentMethod
    case DeletePaymentMethod
    
    //Orders
    case submitOrder
    case submitStandingOrder
    case getDeliveryDates
    case getOrders
    case removeFavourite
}

protocol NetworkStubs {
}

extension NetworkStubs {
    func startStub(_ route: URLRequest, method: HTTPMethod, bodyJSONString: String) {
        if let url = route.url {
            var stub = StubRequest(method: method, url: url)
            var response = StubResponse()
            let body = bodyJSONString.data(using: .utf8)!
            print(body)
            print(bodyJSONString)
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


extension AddOnsServiceTests : NetworkStubs {}
extension PurchaserServiceTests : NetworkStubs {}
extension ProfileServiceTest : NetworkStubs {}
extension MarketplaceServiceTests : NetworkStubs {}
extension ProductsServiceTests : NetworkStubs {}
extension PaymentsServiceTests : NetworkStubs {}
extension NotifyServiceTests : NetworkStubs {}
extension OrderServiceTests : NetworkStubs {}
