//
//  File.swift
//  
//
//  Created by Brandon Stillitano on 31/5/21.
//

import Foundation

/// Request object used to let the Documentum service know that we intend to upload an invoice file.
public struct CreateInvoiceRequest: Codable {
    public init() { }
    
    /// Venue ID for the venue which should own the invoice
    public var retailerId: String = ""
    
    /// Number of endpoints that should be generated for the invoice to be uploaded. This should reflect the number of files that are being uploaded. For example, a multi-page PDF would be `1` as it is a single file.
    public var quantity: Int = 1
}

public struct CreateInvoiceResponse {
    public init() { }
    
    public var id: String = ""
    public var retailerId: String = ""
    public var supplierId: String? = nil
    public var uploadUrls: [String] = []
    public var quantity: Int = 1
    public var state: String = ""
    public var total: String? = nil
    public var date: String? = nil
    public var dueDate: String? = nil
    public var invoiceNumber: String? = nil
}

extension CreateInvoiceResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? nil
        uploadUrls = try container.decodeIfPresent([String].self, forKey: .uploadUrls) ?? []
        quantity = try container.safeIntDecode(forKey: .quantity) ?? 1
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? nil
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? nil
        dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate) ?? nil
        invoiceNumber = try container.decodeIfPresent(String.self, forKey: .invoiceNumber) ?? nil
    }
}
