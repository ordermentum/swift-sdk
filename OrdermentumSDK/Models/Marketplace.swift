//
//  Marketplace.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct MarketplaceResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Marketplace] = []
}

public struct Marketplace {
    var id: String = ""
    var address: Address = Address()
    var name: String = ""
    var abn: String = ""
    var slug: String = ""
    var email: String = ""
    var tradingName: String = ""
    var accountSettings: AccountSettings = AccountSettings()
    var brandImages: [Image] = []
    var logo: Image = Image()
    var settings: MarketplaceSettings = MarketplaceSettings()
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

public struct Properties: Encodable {
    var demoSupplier: String = ""
}

public struct MarketplaceSettings {
    var brand: Brand = Brand()
}

extension MarketplaceResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Marketplace].self, forKey: .data) ?? []
    }
}

extension Marketplace: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        address = try container.decodeIfPresent(Address.self, forKey: .address) ?? Address()
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        abn = try container.decodeIfPresent(String.self, forKey: .abn) ?? ""
        slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .restart) ?? ""
        tradingName = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
        accountSettings = try container.decodeIfPresent(AccountSettings.self, forKey: .accountSettings) ?? AccountSettings()
        brandImages = try container.decodeIfPresent([Image].self, forKey: .brandImages) ?? []
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        settings = try container.decodeIfPresent(MarketplaceSettings.self, forKey: .settings) ?? MarketplaceSettings()
//        properties = try container.decodeIfPresent(Properties.self, forKey: .properties) ?? Properties()
        shortName = try container.decodeIfPresent(String.self, forKey: .shortName) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        activeRetailerIds = try container.decodeIfPresent([String].self, forKey: .activeRetailerIds) ?? []
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        billingStart = try container.decodeIfPresent(String.self, forKey: .billingStart) ?? ""
        billingEnd = try container.decodeIfPresent(String.self, forKey: .billingEnd) ?? ""
        paymentRecurrence = try container.decodeIfPresent(String.self, forKey: .paymentRecurrence) ?? ""
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .restart) ?? ""
    }
}

extension Properties: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        demoSupplier = try container.decodeIfPresent(String.self, forKey: .demoSupplier) ?? ""
    }
}

extension MarketplaceSettings: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        brand = try container.decodeIfPresent(Brand.self, forKey: .brand) ?? Brand()
    }
}
