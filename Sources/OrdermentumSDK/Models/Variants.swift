//
//  Variants.swift
//
//
//  Created by Brandon Stillitano on 17/3/21.
//

import Foundation

public struct VariantsResponse {
    public init() { }

    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [ProductVariant] = []
}

public struct ProductVariant {
    public init() { }

    public var id: String = ""
    public var productId: String = ""
    public var name: String = ""
    public var SKU: String = ""
    public var basePrice: String = ""
    public var randomWeight: Bool = false
    public var unit: String = ""
    public var taxType: String = ""
    public var unitSize: Int = 1
    public var cost: String = ""
    public var weight: String? = nil
    public var outOfStock: Bool = false
    public var salesCode: String = ""
    public var promotional: Bool = false
    public var deactivatedAt: String? = nil
    public var sortOrder: Int = 0
    public var userId: String = ""
    public var updatedById: String? = nil
    public var createdAt: String = ""
    public var updatedAt: String? = nil
    public var deletedAt: String? = nil
    public var deletedById: String? = nil
    public var created_at: String = ""
    public var updated_at: String? = ""
    public var deleted_at: String? = nil
    public var product_id: String = ""
    public var user_id: String = ""
    public var updated_by_id: String? = nil
    public var deleted_by_id: String? = nil
    public var price: String = ""
}

public struct ProductVariantPreview: Encodable {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
}

extension VariantsResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([ProductVariant].self, forKey: .data) ?? []
    }
}

extension ProductVariant: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        productId = try container.decodeIfPresent(String.self, forKey: .productId) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        SKU = try container.decodeIfPresent(String.self, forKey: .SKU) ?? ""
        basePrice = try container.decodeIfPresent(String.self, forKey: .basePrice) ?? ""
        randomWeight = try container.safeBoolDecode(forKey: .randomWeight) ?? false
        unit = try container.decodeIfPresent(String.self, forKey: .unit) ?? ""
        taxType = try container.decodeIfPresent(String.self, forKey: .taxType) ?? ""
        unitSize = try container.safeIntDecode(forKey: .unitSize) ?? 1
        cost = try container.decodeIfPresent(String.self, forKey: .cost) ?? ""
        weight = try container.decodeIfPresent(String.self, forKey: .weight) ?? nil
        outOfStock = try container.safeBoolDecode(forKey: .outOfStock) ?? false
        salesCode = try container.decodeIfPresent(String.self, forKey: .salesCode) ?? ""
        promotional = try container.safeBoolDecode(forKey: .promotional) ?? false
        deactivatedAt = try container.decodeIfPresent(String.self, forKey: .deactivatedAt) ?? nil
        sortOrder = try container.safeIntDecode(forKey: .sortOrder) ?? 0
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .updatedById) ?? nil
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? nil
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? nil
        deletedById = try container.decodeIfPresent(String.self, forKey: .deletedById) ?? nil
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? nil
        product_id = try container.decodeIfPresent(String.self, forKey: .product_id) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
        updated_by_id = try container.decodeIfPresent(String.self, forKey: .updated_by_id) ?? nil
        deleted_by_id = try container.decodeIfPresent(String.self, forKey: .deleted_by_id) ?? nil
        price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
    }
}

extension ProductVariantPreview: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
