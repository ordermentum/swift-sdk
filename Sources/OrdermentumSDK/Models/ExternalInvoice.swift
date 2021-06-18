//
//  ExternalInvoice.swift
//
//
//  Created by Brandon Stillitano on 17/6/21.
//

import Foundation

public struct ExternalInvoice: Encodable {
    public init() { }

    public var id: String = ""
    public var retailerId: String = ""
    public var supplierId: String? = nil
    public var uploadUrls: [String] = []
    public var quantity: Int = 1
    public var state: String = ""
    public var total: String? = nil
    public var taxAmount: String? = nil
    public var date: String? = nil
    public var dueDate: String? = nil
    public var invoiceNumber: String? = nil
    public var potentialSupplier: ExternalSupplier? = nil
    public var downloadUrl: String? = nil
}

public struct ExternalSupplier: Encodable {
    public init() { }

    public var id: String = ""
    public var name: String = ""
    public var new: Bool = false
}

public struct ExternalInvoiceUpdateRequest: Codable {
    public init() { }

    var supplierId: String? = nil
    var invoiceNumber: String? = nil
    var state: String = ""
    var total: String? = nil
    var taxAmount: String? = nil
    var date: String? = nil
    var dueDate: String? = nil
}

extension ExternalInvoice: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? nil
        uploadUrls = try container.decodeIfPresent([String].self, forKey: .uploadUrls) ?? []
        quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 1
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? nil
        taxAmount = try container.decodeIfPresent(String.self, forKey: .taxAmount) ?? nil
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? nil
        dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate) ?? nil
        invoiceNumber = try container.decodeIfPresent(String.self, forKey: .invoiceNumber) ?? nil
        potentialSupplier = try container.decodeIfPresent(ExternalSupplier.self, forKey: .potentialSupplier) ?? nil
        downloadUrl = try container.decodeIfPresent(String.self, forKey: .downloadUrl) ?? nil
    }
}

extension ExternalSupplier: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        new = try container.decodeIfPresent(Bool.self, forKey: .new) ?? false
    }
}
