//
//  ConnectionRequest.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 19/3/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct ConnectionRequest {
    public var id: String = ""
    public var userId: String = ""
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var status: String = ""
    public var updated_at: String = ""
    public var created_at: String = ""
    public var approvedById: String = ""
    public var approvedAt: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var updatedById: String = ""
}

extension ConnectionRequest: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .comments) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .purchaserName) ?? ""
        approvedById = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        approvedAt = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .updatedUserId) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .invoiceIds) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .lineItems) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
    }
}
