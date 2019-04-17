//
//  CreditNotesReponse.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct CreditNotesResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [CreditNote] = []
}

public struct CreditNote {
    public var id: String = ""
    public var number: String = ""
    public var userId: String = ""
    public var comments: String = ""
    public var retailerId: String = ""
    public var purchaserId: String = ""
    public var purchaserName: String = ""
    public var supplierId: String = ""
    public var supplierName: String = ""
    public var updatedUserId: String = ""
    public var invoiceIds: [String] = []
    public var lineItems: [LineItem] = []
    public var subtotal: String = ""
    public var tax: String = ""
    public var total: String = ""
    public var status: String = ""
    public var date: String = ""
    public var cancelledAt: String = ""
    public var deletedAt: String = ""
    public var completedAt: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
}

extension CreditNotesResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([CreditNote].self, forKey: .data) ?? []
    }
}

extension CreditNote: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        comments = try container.decodeIfPresent(String.self, forKey: .comments) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        purchaserName = try container.decodeIfPresent(String.self, forKey: .purchaserName) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? ""
        updatedUserId = try container.decodeIfPresent(String.self, forKey: .updatedUserId) ?? ""
        invoiceIds = try container.decodeIfPresent([String].self, forKey: .invoiceIds) ?? []
        lineItems = try container.decodeIfPresent([LineItem].self, forKey: .lineItems) ?? []
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        tax = try container.decodeIfPresent(String.self, forKey: .tax) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
