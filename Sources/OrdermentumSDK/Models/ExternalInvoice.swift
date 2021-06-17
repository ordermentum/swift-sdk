//
//  ExternalInvoice.swift
//
//
//  Created by Brandon Stillitano on 17/6/21.
//

import Foundation

public struct ExternalInvoice: Codable {
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

public struct ExternalSupplier: Codable {
    public init() { }

    public var id: String = ""
    public var name: String = ""
    public var new: Bool = false
}
