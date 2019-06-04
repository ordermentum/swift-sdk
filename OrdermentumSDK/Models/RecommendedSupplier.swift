//
//  RecommendedSupplier.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 4/6/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

struct RecommendedSupplierResponse {
    var data: [RecommendedSupplierCategory] = []
}

struct RecommendedSupplierTopResponse {
    var data: [RecommendedSupplier] = []
}

struct RecommendedSupplierCategory {
    var category: String = ""
    var suppliers: [RecommendedSupplier] = []
}

struct RecommendedSupplier {
    var dataAttributes: RecommendedSupplierDataAttributes = RecommendedSupplierDataAttributes()
    var logo: Image = Image()
    var phone: String = ""
    var sortOrder: Int = 0
    var supplierId: String = ""
    var tradingName: String = ""
}

struct RecommendedSupplierDataAttributes {
    var categories: [String] = []
    var serviceAreas: String = ""
    var supplierQuote: String = ""
    var primaryCategory: String = ""
    var primaryProducts: String = ""
    var promotedCategories: [String] = []
}

extension RecommendedSupplierResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([RecommendedSupplierCategory].self, forKey: .data) ?? []
    }
}

extension RecommendedSupplierTopResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([RecommendedSupplier].self, forKey: .data) ?? []
    }
}

extension RecommendedSupplierCategory: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        suppliers = try container.decodeIfPresent([RecommendedSupplier].self, forKey: .suppliers) ?? []
    }
}

extension RecommendedSupplier: Decodable {
    init(from decoder: Decoder) throws {
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
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categories = try container.decodeIfPresent([String].self, forKey: .categories) ?? []
        serviceAreas = try container.decodeIfPresent(String.self, forKey: .serviceAreas) ?? ""
        supplierQuote = try container.decodeIfPresent(String.self, forKey: .supplierQuote) ?? ""
        primaryCategory = try container.decodeIfPresent(String.self, forKey: .primaryCategory) ?? ""
        primaryProducts = try container.decodeIfPresent(String.self, forKey: .primaryProducts) ?? ""
        promotedCategories = try container.decodeIfPresent([String].self, forKey: .promotedCategories) ?? []
    }
}
