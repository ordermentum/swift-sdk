//
//  Marketplace.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct MarketplaceResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Marketplace] = []
}

public struct Marketplace {
    public var id: String = ""
    public var address: Address = Address()
    public var name: String = ""
    public var abn: String = ""
    public var slug: String = ""
    public var email: String = ""
    public var tradingName: String = ""
    public var accountSettings: AccountSettings = AccountSettings()
    public var brandImages: [Image] = []
    public var logo: Image = Image()
    public var settings: MarketplaceSettings = MarketplaceSettings()
    public var properties: Properties = Properties()
    public var shortName: String = ""
    public var phone: String = ""
    public var activeRetailerIds: [String] = []
    public var paymentMethodId: String = ""
    public var billingStart: String = ""
    public var billingEnd: String = ""
    public var paymentRecurrence: String = ""
    public var timezone: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
}

public struct Properties: Encodable {
    public init() {}
    
    public var demoSupplier: String = ""
}

public struct MarketplaceSettings {
    public var brand: Brand = Brand()
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
        properties = try container.decodeIfPresent(Properties.self, forKey: .properties) ?? Properties()
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
