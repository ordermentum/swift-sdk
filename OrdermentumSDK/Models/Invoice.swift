//
//  Invoice.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct InvoiceResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Invoice] = []
}

public struct Invoice: Encodable {
    public init() { }

    public var cancelledAt: String = ""
    public var canRequestPaymentMethod: Bool = false
    public var chargeAt: String?
    public var chargedByUserId: String = ""
    public var charged_by_user_id: String = ""
    public var createdAt: String = ""
    public var created_at: String = ""
    public var credit: Float = 0
    public var creditNoteIds: [String] = []
    public var date: String = ""
    public var deletedAt: String = ""
    public var deleted_at: String = ""
    public var dueAt: String = ""
    public var display: InvoiceDisplay = InvoiceDisplay()
    public var externalId: String = ""
    public var hasRequestedPaymentMethod: Bool = false
    public var id: String = ""
    public var invoiceSendAt: String = ""
    public var invoiceSentAt: String = ""
    public var invoiceSyncedAt: String = ""
    public var issue: OrderIssue?
    public var locked: Bool = false
    public var number: String = ""
    public var orders: [Order] = []
    public var paidAt: String = ""
    public var paidSupplierAt: String = ""
    public var payable: Bool = false
    public var paymentMethod: String = ""
    public var paymentMethodId: String = ""
    public var paymentStatus: String = ""
    public var paymentSentAt: String?
    public var paymentSentBy: String?
    public var paymentTransactionId: String = ""
    public var processing: Bool = false
    public var processingError: String = ""
    public var purchaserId: String = ""
    public var purchaser_id: String = ""
    public var reference: String = ""
    public var retailer: Retailer = Retailer()
    public var retailerChargeable: Bool = false
    public var retailerId: String = ""
    public var retailer_id: String = ""
    public var sentLateNotificationAt: Bool = false
    public var sentOverdueNotificationAt: Bool = false
    public var settlementReference: String = ""
    public var status: String = ""
    public var submittedAt: String = ""
    public var subtotal: Float = 0.00
    public var supplier: Supplier = Supplier()
    public var supplierId: String = ""
    public var supplier_id: String = ""
    public var surcharge: Float = 0.00
    public var syncError: String = ""
    public var total: Float = 0.00
    public var totalCost: Float = 0.00
    public var totalDue: Float = 0.00
    public var totalFreight: Float = 0.00
    public var totalGST: Float = 0.00
    public var updatedAt: String = ""
    public var updatedById: String = ""
    public var updated_at: String = ""
    public var updated_by_id: String = ""
    public var userId: String = ""
    public var user_id: String = ""
}

public struct InvoiceFrequency: Encodable {
    public var daily: Bool = false
    public var weekly: Bool = false
    public var monthly: Bool = false
    public var onPlace: Bool = false
    public var fortnightly: Bool = false
}

public struct InvoiceSetting: Encodable {
    public var creation: Bool = false
    public var delivery: Bool = false
}

public struct InvoiceDisplay: Encodable {
    public init() { }
    public var totalCost: String = ""
    public var totalFreight: String = ""
    public var subtotal: String = ""
    public var totalGST: String = ""
    public var total: String = ""
    public var totalDue: String = ""
    public var totalFreightTax: String = ""
    public var totalDiscount: String = ""
    public var totalSponsoredDiscount: String = ""
    public var totalSavings: String = ""
    public var surcharge: String = ""
    public var credit: String = ""
    public var totalSupplierDiscount: String = ""
    public var date: String = ""
    public var dueAt: String = ""
    public var createdAt: String = ""
    public var billingStartDate: String = ""
    public var billingEndDate: String = ""
    public var paymentMethod: String = ""
}

public struct ExportResponse {
    public var completedAt: String = ""
    public var createdAt: String = ""
    public var fileType: String = ""
    public var id: String = ""
    public var link: String = ""
    public var restart: Bool = false
    public var status: String = ""
    public var type: String = ""
}

public struct ExportDownloadResponse {
    public var link: String = ""
}

public struct ExportRequest: Codable {
    public var data: ExportRequestData = ExportRequestData()
    public var name: String = ""
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var type: String = ""
    public var socketId: String = ""
    public init() { }
}

public struct ExportRequestData: Codable {
    public var includedIds: [String] = []
    public var all: Bool = false
    public var searchQuery: String = ""
    public init() { }
}

public struct InvoicePaymentRequest: Codable {
    public var paymentMethodId: String = ""
    public init() { }
}

extension Invoice {
    public func hasCreditNotesApplied() -> Bool {
        return !self.creditNoteIds.isEmpty
    }
}

extension InvoiceResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Invoice].self, forKey: .data) ?? []
    }
}

extension Invoice: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        canRequestPaymentMethod = try container.safeBoolDecode(forKey: .canRequestPaymentMethod) ?? false
        chargeAt = try container.decodeIfPresent(String.self, forKey: .chargeAt)
        chargedByUserId = try container.decodeIfPresent(String.self, forKey: .chargedByUserId) ?? ""
        charged_by_user_id = try container.decodeIfPresent(String.self, forKey: .charged_by_user_id) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        credit = try container.safeFloatDecode(forKey: .credit) ?? 0.00
        creditNoteIds = try container.decodeIfPresent([String].self, forKey: .creditNoteIds) ?? []
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        display = try container.decodeIfPresent(InvoiceDisplay.self, forKey: .display) ?? InvoiceDisplay()
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId) ?? ""
        hasRequestedPaymentMethod = try container.safeBoolDecode(forKey: .hasRequestedPaymentMethod) ?? false
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        invoiceSendAt = try container.decodeIfPresent(String.self, forKey: .invoiceSendAt) ?? ""
        invoiceSentAt = try container.decodeIfPresent(String.self, forKey: .invoiceSentAt) ?? ""
        invoiceSyncedAt = try container.decodeIfPresent(String.self, forKey: .invoiceSyncedAt) ?? ""
        issue = try container.decodeIfPresent(OrderIssue.self, forKey: .issue)
        locked = try container.safeBoolDecode(forKey: .locked) ?? false
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        orders = try container.decodeIfPresent([Order].self, forKey: .orders) ?? []
        paidAt = try container.decodeIfPresent(String.self, forKey: .paidAt) ?? ""
        paidSupplierAt = try container.decodeIfPresent(String.self, forKey: .paidSupplierAt) ?? ""
        payable = try container.safeBoolDecode(forKey: .payable) ?? false
        paymentMethod = try container.decodeIfPresent(String.self, forKey: .paymentMethod) ?? ""
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        paymentSentAt = try container.decodeIfPresent(String.self, forKey: .paymentSentAt)
        paymentSentBy = try container.decodeIfPresent(String.self, forKey: .paymentSentBy)
        paymentStatus = try container.decodeIfPresent(String.self, forKey: .paymentStatus) ?? ""
        paymentTransactionId = try container.decodeIfPresent(String.self, forKey: .paymentTransactionId) ?? ""
        processing = try container.safeBoolDecode(forKey: .processing) ?? false
        processingError = try container.decodeIfPresent(String.self, forKey: .processingError) ?? ""
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        purchaser_id = try container.decodeIfPresent(String.self, forKey: .purchaser_id) ?? ""
        reference = try container.decodeIfPresent(String.self, forKey: .reference) ?? ""
        retailerChargeable = try container.safeBoolDecode(forKey: .retailerChargeable) ?? false
        retailer = try container.decodeIfPresent(Retailer.self, forKey: .retailer) ?? Retailer()
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        retailer_id = try container.decodeIfPresent(String.self, forKey: .retailer_id) ?? ""
        sentLateNotificationAt = try container.safeBoolDecode(forKey: .sentLateNotificationAt) ?? false
        sentOverdueNotificationAt = try container.safeBoolDecode(forKey: .sentOverdueNotificationAt) ?? false
        settlementReference = try container.decodeIfPresent(String.self, forKey: .settlementReference) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        submittedAt = try container.decodeIfPresent(String.self, forKey: .submittedAt) ?? ""
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0.00
        supplier = try container.decodeIfPresent(Supplier.self, forKey: .supplier) ?? Supplier()
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        supplier_id = try container.decodeIfPresent(String.self, forKey: .supplier_id) ?? ""
        syncError = try container.decodeIfPresent(String.self, forKey: .syncError) ?? ""
        total = try container.safeFloatDecode(forKey: .total) ?? 0.00
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0.00
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0.00
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0.00
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0.00
        surcharge = try container.safeFloatDecode(forKey: .surcharge) ?? 0.00
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .updatedById) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        updated_by_id = try container.decodeIfPresent(String.self, forKey: .updated_by_id) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
    }
}

extension InvoiceFrequency: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        daily = try container.safeBoolDecode(forKey: .daily) ?? false
        weekly = try container.safeBoolDecode(forKey: .weekly) ?? false
        monthly = try container.safeBoolDecode(forKey: .monthly) ?? false
        onPlace = try container.safeBoolDecode(forKey: .onPlace) ?? false
        fortnightly = try container.safeBoolDecode(forKey: .fortnightly) ?? false
    }
}

extension InvoiceSetting: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        creation = try container.safeBoolDecode(forKey: .creation) ?? false
        delivery = try container.safeBoolDecode(forKey: .delivery) ?? false
    }
}

extension InvoiceDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        totalCost = try container.decodeIfPresent(String.self, forKey: .totalCost) ?? ""
        totalFreight = try container.decodeIfPresent(String.self, forKey: .totalFreight) ?? ""
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        totalGST = try container.decodeIfPresent(String.self, forKey: .totalGST) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        totalDue = try container.decodeIfPresent(String.self, forKey: .totalDue) ?? ""
        totalFreightTax = try container.decodeIfPresent(String.self, forKey: .totalFreightTax) ?? ""
        totalDiscount = try container.decodeIfPresent(String.self, forKey: .totalDiscount) ?? ""
        totalSponsoredDiscount = try container.decodeIfPresent(String.self, forKey: .totalSponsoredDiscount) ?? ""
        totalSavings = try container.decodeIfPresent(String.self, forKey: .totalSavings) ?? ""
        surcharge = try container.decodeIfPresent(String.self, forKey: .surcharge) ?? ""
        credit = try container.decodeIfPresent(String.self, forKey: .credit) ?? ""
        totalSupplierDiscount = try container.decodeIfPresent(String.self, forKey: .totalSupplierDiscount) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        billingStartDate = try container.decodeIfPresent(String.self, forKey: .billingStartDate) ?? ""
        billingEndDate = try container.decodeIfPresent(String.self, forKey: .billingEndDate) ?? ""
        paymentMethod = try container.decodeIfPresent(String.self, forKey: .paymentMethod) ?? ""
    }
}

extension ExportResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        fileType = try container.decodeIfPresent(String.self, forKey: .fileType) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        restart = try container.safeBoolDecode(forKey: .restart) ?? false
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}

extension ExportDownloadResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
    }
}

extension Invoice: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        return ["invoiceNumber": number,
                "invoiceTotal": String(total),
                "invoiceTotalDue": String(totalDue)]
    }
}
