//
//  CreditNotesReponse.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct CreditNotesResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [CreditNote] = []
}

struct CreditNote {
    var id: String = ""
    var number: String = ""
    var userId: String = ""
    var comments: String = ""
    var retailerId: String = ""
    var purchaserId: String = ""
    var purchaserName: String = ""
    var supplierId: String = ""
    var supplierName: String = ""
    var updatedUserId: String = ""
    var invoiceIds: [String] = []
    var lineItems: [LineItem] = []
    var subtotal: String = ""
    var tax: String = ""
    var total: String = ""
    var status: String = ""
    var date: String = ""
    var cancelledAt: String = ""
    var deletedAt: String = ""
    var completedAt: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
}

extension CreditNotesResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([CreditNote].self, forKey: .data) ?? []
    }
}

extension CreditNote: Decodable {
    init(from decoder: Decoder) throws {
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
