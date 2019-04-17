//
//  CreateMarketPlace.swift
//  OrdermentumSDK
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct CreateMarketPlace: Codable {
    var id: String = ""
    var address: Address = Address()
    var name: String = ""
    var abn: String = ""
    var slug: String = ""
    var email: String = ""
    var tradingName: String = ""
    //var accountSettings: AccountSettings = AccountSettings()
    var brandImages: [Image] = []
    var logo: Image = Image()
   //var settings: MarketplaceSettings = MarketplaceSettings()
    var properties: Properties = Properties()
    var shortName: String = ""
    var phone: String = ""
    var activeRetailerIds: [String] = []
    var paymentMethodId: String = ""
    var billingStart: String = ""
    var billingEnd: String = ""
    var paymentRecurrence: String = ""
    var timezone: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
}








