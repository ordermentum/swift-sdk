//
//  RouterMethod.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 18/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

protocol GetMethod {
}

protocol GetEnvironmentVar {
}

//Get the method from the route, returns String to Hippolyte HTTPMethod
extension GetMethod {
    func getRouterMethod(url: URLRequestConvertible) -> String {
        let method = url.urlRequest?.httpMethod ?? ""
        return method
    }
}

extension GetEnvironmentVar {
    func getEnvironmentIntVar(_ name: String) -> Int? {
        guard let rawValue = getenv(name) else { return 0 }
        return Int(String(utf8String: rawValue) ?? "0")
    }
    
    func getEnvironmentStrVar(_ name: String) -> String? {
        guard let rawValue = getenv(name) else { return "" }
        return String(utf8String: rawValue) ?? "0"
    }
}

extension AddOnsServiceTests : GetMethod {}
extension PurchaserServiceTests : GetMethod {}
extension ProfileServiceTest : GetMethod {}
extension MarketplaceServiceTests : GetMethod {}
extension ProductsServiceTests : GetMethod {}
extension PaymentsServiceTests : GetMethod {}

extension MarketplaceServiceTests : GetEnvironmentVar {}
extension ProfileServiceTest : GetEnvironmentVar {}

