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
    
    public var dataAttributes: RecommendedSupplierDataAttributes = RecommendedSupplierDataAttributes()
    public var logo: Image = Image()
    public var phone: String = ""
    public var sortOrder: Int = 0
    public var supplierId: String = ""
    public var tradingName: String = ""
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
        dataAttributes = try container.decodeIfPresent(RecommendedSupplierDataAttributes.self, forKey: .dataAttributes) ?? RecommendedSupplierDataAttributes()
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder) ?? 0
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        tradingName = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
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

extension RecommendedSupplier: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        var propertiesDictionary: [String: String] = [:]
        propertiesDictionary["tradingName"] = tradingName
        propertiesDictionary["supplierId"] = supplierId
        
        return propertiesDictionary
    }
}
