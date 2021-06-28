//
//  InvoiceList.swift
//
//
//  Created by Brandon Stillitano on 27/5/21.
//

import Foundation

public struct InvoiceListResponse {
    public init() { }

    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [ListInvoice] = []
}

public struct ListInvoice {
    public init() { }

    public var id: String = ""
    public var retailerId: String = ""
    public var invoiceNumber: String = ""
    public var total: String = ""
    public var date: String = ""
    public var dueAt: String = ""
    public var paidAt: String? = nil
    public var supplierId: String? = nil
    public var supplierName: String? = nil
    public var scheduled: Bool = false
    public var type: String = ""
    public var state: String? = nil
}

extension InvoiceListResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([ListInvoice].self, forKey: .data) ?? []
    }
}

extension ListInvoice: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        invoiceNumber = try container.decodeIfPresent(String.self, forKey: .invoiceNumber) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        paidAt = try container.decodeIfPresent(String.self, forKey: .paidAt) ?? nil
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? nil
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? nil
        scheduled = try container.safeBoolDecode(forKey: .scheduled) ?? false
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? nil
    }
}
