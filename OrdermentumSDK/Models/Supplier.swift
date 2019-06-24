//
//  Supplier.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Supplier: Encodable {
    public init() {}
    
    public var live: Bool = false
    public var id: String = ""
    public var name: String = ""
    public var slug: String = ""
    public var tradingName: String = ""
    public var dataAttributes: DataAttributes = DataAttributes()
    public var accountSettings: VenueAccountSettings = VenueAccountSettings()
    public var settings: Settings = Settings()
    public var shortName: String = ""
    public var active: Bool = false
    public var phone: String = ""
    public var abn: String = ""
    public var email: String = ""
    public var sharedSecret: String = ""
    public var addressId: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var billingStart: String = ""
    public var billingEnd: String = ""
    public var userId: String = ""
    public var paymentRecurrence: String = ""
    public var invoiceSetting: String = ""
    public var timezone: String = ""
    public var paymentMethodId: String = ""
    public var contactFirstName: String = ""
    public var contactLastName: String = ""
    public var contactEmail: String = ""
    public var corporateEntity: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var user_id: String = ""
    public var address_id: String = ""
    public var logo: Image = Image()
}

extension Supplier: Decodable {
    public init(from decoder: Decoder) throws {
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
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
    }
}

extension Supplier: Equatable {
    public static func == (lhs: Supplier, rhs: Supplier) -> Bool {
        return lhs.id == rhs.id
    }
}
