//
//  Supplier.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Supplier: Encodable {
    var live: Bool = false
    var id: String = ""
    var name: String = ""
    var slug: String = ""
    var tradingName: String = ""
    var dataAttributes: DataAttributes = DataAttributes()
    var accountSettings: VenueAccountSettings = VenueAccountSettings()
    var settings: Settings = Settings()
    var shortName: String = ""
    var active: Bool = false
    var phone: String = ""
    var abn: String = ""
    var email: String = ""
    var sharedSecret: String = ""
    var addressId: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
    var deletedAt: String = ""
    var billingStart: String = ""
    var billingEnd: String = ""
    var userId: String = ""
    var paymentRecurrence: String = ""
    var invoiceSetting: String = ""
    var timezone: String = ""
    var paymentMethodId: String = ""
    var contactFirstName: String = ""
    var contactLastName: String = ""
    var contactEmail: String = ""
    var corporateEntity: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var user_id: String = ""
    var address_id: String = ""
}

extension Supplier: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        live = try container.decodeIfPresent(Bool.self, forKey: .live) ?? false
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        tradingName = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
        dataAttributes = try container.decodeIfPresent(DataAttributes.self, forKey: .dataAttributes) ?? DataAttributes()
        accountSettings = try container.decodeIfPresent(VenueAccountSettings.self, forKey: .accountSettings) ?? VenueAccountSettings()
        settings = try container.decodeIfPresent(Settings.self, forKey: .settings) ?? Settings()
        shortName = try container.decodeIfPresent(String.self, forKey: .shortName) ?? ""
        active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        abn = try container.decodeIfPresent(String.self, forKey: .abn) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        sharedSecret = try container.decodeIfPresent(String.self, forKey: .sharedSecret) ?? ""
        addressId = try container.decodeIfPresent(String.self, forKey: .addressId) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        billingStart = try container.decodeIfPresent(String.self, forKey: .billingStart) ?? ""
        billingEnd = try container.decodeIfPresent(String.self, forKey: .billingEnd) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        paymentRecurrence = try container.decodeIfPresent(String.self, forKey: .paymentRecurrence) ?? ""
        invoiceSetting = try container.decodeIfPresent(String.self, forKey: .invoiceSetting) ?? ""
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        contactFirstName = try container.decodeIfPresent(String.self, forKey: .contactFirstName) ?? ""
        contactLastName = try container.decodeIfPresent(String.self, forKey: .contactLastName) ?? ""
        contactEmail = try container.decodeIfPresent(String.self, forKey: .contactEmail) ?? ""
        corporateEntity = try container.decodeIfPresent(String.self, forKey: .corporateEntity) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
        address_id = try container.decodeIfPresent(String.self, forKey: .address_id) ?? ""
    }
}
