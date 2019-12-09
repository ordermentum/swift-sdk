//
//  RecommendedSupplier.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 4/6/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct RecommendedSupplierResponse {
    public init() {}
    
    public var data: [RecommendedSupplierCategory] = []
}

public struct RecommendedSupplierTopResponse {
    public init() {}
    
    public var data: [RecommendedSupplier] = []
}

public struct RecommendedSupplierCategory {
    public init() {}
    
    public var category: String = ""
    public var suppliers: [RecommendedSupplier] = []
}

public struct RecommendedSupplier {
    public init() {}
    
    public var id: String = ""
    public var dataAttributes: RecommendedSupplierDataAttributes = RecommendedSupplierDataAttributes()
    public var logo: Image = Image()
    public var address: Address = Address()
    public var phone: String = ""
    public var sortOrder: Int = 0
    public var supplierId: String = ""
    public var tradingName: String = ""
    public var autoConnect: Bool = false
    public var marketplaceSupplier: Bool = false
    public var accountSettings: RecommendedSupplierAccountSettings = RecommendedSupplierAccountSettings()
}

public struct RecommendedSupplierDataAttributes {
    public init() {}
    
    public var categories: [String] = []
    public var serviceAreas: String = ""
    public var supplierQuote: String = ""
    public var primaryCategory: String = ""
    public var primaryProducts: String = ""
    public var promotedCategories: [String] = []
}

public struct RecommendedSupplierAccountSettings {
    public init() {}
    
    public var marketplace: Bool = false
    public var autoConnect: Bool = false
    public var salePercentage: String = ""
    public var connectionEmail: String = ""
    public var publicDirectory: Bool = false
}

extension RecommendedSupplierResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([RecommendedSupplierCategory].self, forKey: .data) ?? []
    }
}

extension RecommendedSupplierTopResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([RecommendedSupplier].self, forKey: .data) ?? []
    }
}

extension RecommendedSupplierCategory: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        suppliers = try container.decodeIfPresent([RecommendedSupplier].self, forKey: .suppliers) ?? []
    }
}

extension RecommendedSupplier: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        autoConnect = try container.safeBoolDecode(forKey: .autoConnect) ?? false
        dataAttributes = try container.decodeIfPresent(RecommendedSupplierDataAttributes.self, forKey: .dataAttributes) ?? RecommendedSupplierDataAttributes()
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        marketplaceSupplier = try container.safeBoolDecode(forKey: .marketplaceSupplier) ?? false
        address = try container.decodeIfPresent(Address.self, forKey: .address) ?? Address()
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        sortOrder = try container.safeIntDecode(forKey: .sortOrder) ?? 0
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        tradingName = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
        accountSettings = try container.decodeIfPresent(RecommendedSupplierAccountSettings.self, forKey: .accountSettings) ?? RecommendedSupplierAccountSettings()
    }
}

extension RecommendedSupplierDataAttributes: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categories = try container.decodeIfPresent([String].self, forKey: .categories) ?? []
        serviceAreas = try container.decodeIfPresent(String.self, forKey: .serviceAreas) ?? ""
        supplierQuote = try container.decodeIfPresent(String.self, forKey: .supplierQuote) ?? ""
        primaryCategory = try container.decodeIfPresent(String.self, forKey: .primaryCategory) ?? ""
        primaryProducts = try container.decodeIfPresent(String.self, forKey: .primaryProducts) ?? ""
        promotedCategories = try container.decodeIfPresent([String].self, forKey: .promotedCategories) ?? []
    }
}

extension RecommendedSupplierAccountSettings: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        marketplace = try container.safeBoolDecode(forKey: .marketplace) ?? false
        autoConnect = try container.safeBoolDecode(forKey: .autoConnect) ?? false
        salePercentage = try container.decodeIfPresent(String.self, forKey: .salePercentage) ?? ""
        connectionEmail = try container.decodeIfPresent(String.self, forKey: .connectionEmail) ?? ""
        publicDirectory = try container.safeBoolDecode(forKey: .publicDirectory) ?? false
    }
}

extension RecommendedSupplier: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        var properties: [String: String] = [:]
        properties["directorySupplierName"] = tradingName
        properties["directorySupplierId"] = supplierId
        properties["marketplace"] = marketplaceSupplier.toString()
        properties["categoriesShown"] = accountSettings.publicDirectory.toString()
        
        return properties
    }
}
