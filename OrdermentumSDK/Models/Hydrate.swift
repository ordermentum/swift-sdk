//
//  Hydrate.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 22/12/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct HydrateResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [AbandonedCart] = []
}

public struct AbandonedCart {
    public var id: String = ""
    public var supplierId: String = ""
    public var retailerId: String = ""
    public var purchaserId: String = ""
    public var userId: String = ""
    public var total: Float = 0.00
    public var updatedAt: String = ""
    public var createdAt: String = ""
    public var device: String = ""
    public var seenAt: String = ""
    public var lineItems: [ValidationLineItem] = []
}

extension HydrateResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([AbandonedCart].self, forKey: .data) ?? []
    }
}

extension AbandonedCart: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        total = try container.decodeIfPresent(Float.self, forKey: .total) ?? 0
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        device = try container.decodeIfPresent(String.self, forKey: .device) ?? ""
        seenAt = try container.decodeIfPresent(String.self, forKey: .seenAt) ?? ""
        lineItems = try container.decodeIfPresent([ValidationLineItem].self, forKey: .lineItems) ?? []
    }
}
