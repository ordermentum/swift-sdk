//
//  RouterMethod.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 24/04/2019.
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
    func getEnvironmentVar(_ name: String) -> String? {
        guard let rawValue = getenv(name) else { return "" }
        return String(utf8String: rawValue)
    }
}

extension AddOnsServiceTests : GetMethod {}
extension ProfileServiceTest : GetMethod {}
extension MarketplaceServiceTests : GetMethod {}
extension ProductsServiceTests : GetMethod {}

extension MarketplaceServiceTests : GetEnvironmentVar {}
extension ProfileServiceTest : GetEnvironmentVar {}
extension ProductsServiceTests : GetEnvironmentVar {}
