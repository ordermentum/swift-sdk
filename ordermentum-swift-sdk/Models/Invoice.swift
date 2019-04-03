//
//  Invoice.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct InvoiceResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Invoice] = []
}

struct Invoice: Encodable {
    var cancelledAt: String = ""
    var chargedByUserId: String = ""
    var charged_by_user_id: String = ""
    var createdAt: String = ""
    var created_at: String = ""
    var credit: String = ""
    var creditNoteIds: [String] = []
    var date: String = ""
    var deletedAt: String = ""
    var deleted_at: String = ""
    var dueAt: String = ""
    var display: InvoiceDisplay = InvoiceDisplay()
    var externalId: String = ""
    var id: String = ""
    var invoiceSendAt: String = ""
    var invoiceSentAt: String = ""
    var invoiceSyncedAt: String = ""
    var locked: Bool = false
    var number: String = ""
    var orders: [Order] = []
    var paidAt: String = ""
    var paidSupplierAt: String = ""
    var payable: Bool = false
    var paymentMethod: String = ""
    var paymentMethodId: String = ""
    var paymentStatus: String = ""
    var paymentTransactionId: String = ""
    var processing: Bool = false
    var processingError: String = ""
    var properties: Properties = Properties()
    var purchaserId: String = ""
    var purchaser_id: String = ""
    var reference: String = ""
    var retailerChargeable: Bool = false
    var retailerId: String = ""
    var retailer_id: String = ""
    var sentLateNotificationAt: Bool = false
    var sentOverdueNotificationAt: Bool = false
    var settlementReference: String = ""
    var submittedAt: String = ""
    var subtotal: Float = 0
    var supplierId: String = ""
    var supplier_id: String = ""
    var syncError: String = ""
    var total: Float = 0
    var totalCost: Float = 0
    var totalDue: Float = 0
    var totalFreight: Float = 0
    var totalGST: Float = 0
    var updatedAt: String = ""
    var updatedById: String = ""
    var updated_at: String = ""
    var updated_by_id: String = ""
    var userId: String = ""
    var user_id: String = ""
}

struct InvoiceFrequency {
    var daily: Bool = false
    var weekly: Bool = false
    var monthly: Bool = false
    var onPlace: Bool = false
    var fortnightly: Bool = false
}

struct InvoiceSetting {
    var creation: Bool = false
    var delivery: Bool = false
}

struct InvoiceDisplay: Encodable {
    var subtotal: String = ""
    var total: String = ""
    var totalCost: String = ""
    var totalFreight: String = ""
    var totalGST: String = ""
    var totalFreightTax: String = ""
    var totalDue: String = ""
    var date: String = ""
    var dueAt: String = ""
    var createdAt: String = ""
    var billingStartDate: String = ""
    var billingEndDate: String = ""
}

struct ExportResponse {
    var completedAt: String = ""
    var createdAt: String = ""
    var fileType: String = ""
    var id: String = ""
    var link: String = ""
    var restart: Bool = false
    var status: String = ""
    var type: String = ""
}

struct ExportRequest {
    var data: ExportRequestData = ExportRequestData()
    var name: String = ""
    var retailerId: String = ""
    var supplierId: String = ""
    var type: String = ""
    var socketId: String = ""
}

struct ExportRequestData {
    var includedIds: [String] = []
    var all: Bool = false
    var searchQuery: String = ""
}

struct InvoicePaymentRequest {
    var paymentMethodId: String = ""
}

extension InvoiceResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Invoice].self, forKey: .data) ?? []
    }
}

extension Invoice: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        chargedByUserId = try container.decodeIfPresent(String.self, forKey: .chargedByUserId) ?? ""
        charged_by_user_id = try container.decodeIfPresent(String.self, forKey: .charged_by_user_id) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        credit = try container.decodeIfPresent(String.self, forKey: .credit) ?? ""
        creditNoteIds = try container.decodeIfPresent([String].self, forKey: .creditNoteIds) ?? []
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        display = try container.decodeIfPresent(InvoiceDisplay.self, forKey: .display) ?? InvoiceDisplay()
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        invoiceSendAt = try container.decodeIfPresent(String.self, forKey: .invoiceSendAt) ?? ""
        invoiceSentAt = try container.decodeIfPresent(String.self, forKey: .invoiceSentAt) ?? ""
        invoiceSyncedAt = try container.decodeIfPresent(String.self, forKey: .invoiceSyncedAt) ?? ""
        locked = try container.decodeIfPresent(Bool.self, forKey: .locked) ?? false
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        orders = try container.decodeIfPresent([Order].self, forKey: .orders) ?? []
        paidAt = try container.decodeIfPresent(String.self, forKey: .paidAt) ?? ""
        paidSupplierAt = try container.decodeIfPresent(String.self, forKey: .paidSupplierAt) ?? ""
        payable = try container.decodeIfPresent(Bool.self, forKey: .payable) ?? false
        paymentMethod = try container.decodeIfPresent(String.self, forKey: .paymentMethod) ?? ""
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        paymentStatus = try container.decodeIfPresent(String.self, forKey: .paymentStatus) ?? ""
        paymentTransactionId = try container.decodeIfPresent(String.self, forKey: .paymentTransactionId) ?? ""
        processing = try container.decodeIfPresent(Bool.self, forKey: .processing) ?? false
        processingError = try container.decodeIfPresent(String.self, forKey: .processingError) ?? ""
        properties = try container.decodeIfPresent(Properties.self, forKey: .properties) ?? Properties()
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        purchaser_id = try container.decodeIfPresent(String.self, forKey: .purchaser_id) ?? ""
        reference = try container.decodeIfPresent(String.self, forKey: .reference) ?? ""
        retailerChargeable = try container.decodeIfPresent(Bool.self, forKey: .retailerChargeable) ?? false
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        retailer_id = try container.decodeIfPresent(String.self, forKey: .retailer_id) ?? ""
        sentLateNotificationAt = try container.decodeIfPresent(Bool.self, forKey: .sentLateNotificationAt) ?? false
        sentOverdueNotificationAt = try container.decodeIfPresent(Bool.self, forKey: .sentOverdueNotificationAt) ?? false
        settlementReference = try container.decodeIfPresent(String.self, forKey: .settlementReference) ?? ""
        submittedAt = try container.decodeIfPresent(String.self, forKey: .submittedAt) ?? ""
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        supplier_id = try container.decodeIfPresent(String.self, forKey: .supplier_id) ?? ""
        syncError = try container.decodeIfPresent(String.self, forKey: .syncError) ?? ""
        total = try container.safeFloatDecode(forKey: .total) ?? 0
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .updatedById) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        updated_by_id = try container.decodeIfPresent(String.self, forKey: .updated_by_id) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
    }
}

extension InvoiceFrequency: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        daily = try container.decodeIfPresent(Bool.self, forKey: .daily) ?? false
        weekly = try container.decodeIfPresent(Bool.self, forKey: .weekly) ?? false
        monthly = try container.decodeIfPresent(Bool.self, forKey: .monthly) ?? false
        onPlace = try container.decodeIfPresent(Bool.self, forKey: .onPlace) ?? false
        fortnightly = try container.decodeIfPresent(Bool.self, forKey: .fortnightly) ?? false
    }
}

extension InvoiceSetting: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        creation = try container.decodeIfPresent(Bool.self, forKey: .creation) ?? false
        delivery = try container.decodeIfPresent(Bool.self, forKey: .delivery) ?? false
    }
}

extension InvoiceDisplay: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        totalCost = try container.decodeIfPresent(String.self, forKey: .totalCost) ?? ""
        totalFreight = try container.decodeIfPresent(String.self, forKey: .totalFreight) ?? ""
        totalGST = try container.decodeIfPresent(String.self, forKey: .totalGST) ?? ""
        totalFreightTax = try container.decodeIfPresent(String.self, forKey: .totalFreightTax) ?? ""
        totalDue = try container.decodeIfPresent(String.self, forKey: .totalDue) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        billingStartDate = try container.decodeIfPresent(String.self, forKey: .billingStartDate) ?? ""
        billingEndDate = try container.decodeIfPresent(String.self, forKey: .billingEndDate) ?? ""
    }
}

extension ExportResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        fileType = try container.decodeIfPresent(String.self, forKey: .fileType) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        restart = try container.decodeIfPresent(Bool.self, forKey: .restart) ?? false
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}
