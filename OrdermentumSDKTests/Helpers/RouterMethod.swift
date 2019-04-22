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

extension GetMethod {
    func getRouterMethod(url: URLRequestConvertible) -> String {
        let method = url.urlRequest?.httpMethod ?? ""
        return method
    }
}

extension AddOnsServiceTests : GetMethod {}
extension PurchaserServiceTests : GetMethod {}
extension ProfileServiceTest : GetMethod {}
extension MarketplaceServiceTests : GetMethod {}
extension ProductsServiceTests : GetMethod {}
extension PaymentsServiceTests : GetMethod {}
