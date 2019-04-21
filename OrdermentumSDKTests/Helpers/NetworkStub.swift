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
    case GetPurchaserForPaymentMethodError = "GetPurchaserForPaymentMethod_jsonError"
    case UpdatePaymentMethod
    case UpdatePaymentMethodError = "Update_jsonError"
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
    
    func startStub(_ route: URLRequest, method: HTTPMethod, stubData: StubDataFile) {
        if let url = route.url {
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
