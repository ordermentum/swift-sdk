//
//  Order.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct CreateOrder: Codable {
    var comment: String = ""
    var deliveryDate: String = ""
    var lineItems: [CreateOrderLineItem] = []
    var origin: String = ""
    var reference: String = ""
    var retailerId: String = ""
    var status: String = ""
    var supplierId: String = ""
    var tokenId: String = ""
    var type: String = ""
    var paymentMethodId: String = ""
}

struct CreateOrderLineItem: Codable {
    var name: String = ""
    var price: Float = 0.00
    var productId: String = ""
    var quantity: Int
}

struct OrderResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Order] = []
}

struct ClassicStandingOrderResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [ClassicStandingOrder] = []
}

struct Order: Encodable {
    var canMarkAsPaid: Bool = false
    var canMarkAsUnpaid: Bool = false
    var cancelledAt: String = ""
    var chargable: Bool = false
    var chargedAt: String = ""
    var chargedBy: String = ""
    var chargedByUser: String = ""
    var comment: String = ""
    var completeAt: String = ""
    var color: String = ""
    var createdAt: String = ""
    var createdBy: String = ""
    var deliveryDate: String = ""
    var directProcessing: Bool = false
    var display: Display = Display()
    var dueAt: String = ""
    var editable: Bool = false
    var freight: Float = 0.00
    var id: String = ""
    var invoice: Invoice = Invoice()
    var invoiceId: String = ""
    var invoiceNumber: String = ""
    var invoiceReference: String = ""
    var isOutstanding: Bool = false
    var label: String = ""
    var lineItems: [LineItem] = []
    var locked: Bool = false
    var name: String = ""
    var noPaymentActions: Bool = false
    var number: String = ""
    var orderNumber: String = ""
    var orderStatus: String = ""
    var paidAt: String = ""
    var paidToSupplier: String = ""
    var paymentDelay: Int = 0
    var paymentMethodType: PaymentMethodType = PaymentMethodType()
    var paymentStatus: String = ""
    var placedByName: String = ""
    var processingError: String = ""
    var properties: Properties = Properties()
    var randomWeight: Bool = false
    var retailerAlias: String = ""
    var retailerEditable: Bool = false
    var retailerName: String = ""
    var status: String = ""
    var subtotal: Float = 0.00
    var supplier: Supplier = Supplier()
    var total: Float = 0.00
    var totalCost: Float = 0.00
    var totalDue: Float = 0.00
    var totalFreight: Float = 0.00
    var totalGST: Float = 0.00
    var totalQuantity: Float = 0.00
    var type: String = ""
    var updatedAt: String = ""
    var updatedByName: String = ""
}

struct LineItem: Encodable {
    var SKU: String = ""
    var batchCode: String = ""
    var createdAt: String = ""
    var display: Display = Display()
    var gst: String = ""
    var looseCount: Int = 0
    var locked: Bool = false
    var name: String = ""
    var orderId: String = ""
    var packCount: Int = 0
    var price: String = ""
    var product: Product = Product()
    var productId: String = ""
    var properties: Properties = Properties()
    var quantity: Int = 0
    var ratePrice: String = ""
    var subtotal: String = ""
    var tax: String = ""
    var taxable: Bool = false
    var total: String = ""
    var totalWeight: Float = 0
    var updatedAt: String = ""
    var weight: Float = 0
}

struct ClassicStandingOrder {
    var id: String = ""
    var name: String = ""
    var alias: String = ""
    var remindedAt: String = ""
    var placedAt: String = ""
    var place: Bool = false
    var purchaserId: String = ""
    var userId: String = ""
    var orderId: String = ""
    var supplierId: String = ""
    var schedule: ClassicStandingOrderSchedule = ClassicStandingOrderSchedule()
    var createdAt: String = ""
    var updatedAt: String = ""
    var activityEnded: Bool = false
    var nextRunAt: String = ""
    var nextFinishAt: String = ""
    var scheduleId: String = ""
    var nextRunDate: String = ""
    var cancelled: [String] = []
    var updatedBy: ClassicStandingOrderUpdatedBy = ClassicStandingOrderUpdatedBy()
    var nextRunCancelled: Bool = false
    var scheduleEnabled: Bool = false
    var startDate: String = ""
    var endDate: String = ""
}

struct ClassicStandingOrderSchedule {
    var id: String = ""
    var name: String = ""
    var alias: String = ""
    var cutOffTime: String = ""
    var editableUntil: Int = 0
    var includeWeekends: Bool = false
    var recurrence: String = ""
    var frequency: String = ""
    var deliveryDelay: Int = 0
    var supplierId: String = ""
    var userId: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
    var recurrenceInfo: ClassicStandingOrderRecurrenceInfo = ClassicStandingOrderRecurrenceInfo()
    var escalationTime: String = ""
    var firstReminder: String = ""
    var enabled: Bool = false
    var lastFinishedAt: String = ""
    var supplierName: String = ""
    var standingOrders: Bool = false
    var supplier: ClassicStandingOrderSupplier = ClassicStandingOrderSupplier()
    var lastStartedAt: String = ""
    var defaultSchedule: Bool = false
    var cutOffPassed: Bool = false
    var nextRun: [String] = []
    var timezone: String = ""
}

struct ClassicStandingOrderRecurrenceInfo {
    var freq: String = ""
    var byhour: String = ""
    var byminute: String = ""
    var interval: String = ""
    var timezone: String = ""
}

struct ClassicStandingOrderSupplier {
    var name: String = ""
}

struct ClassicStandingOrderUpdatedBy {
    var firstName: String = ""
    var lastName: String = ""
}

public struct CreateFavouriteRequest: Codable {
    var comment: String = ""
    var deliveryDate: String = ""
    var lineItems: [CreateFavouriteRequestLineItem] = []
    var origin: String = ""
    var reference: String = ""
    var retailerId: String = ""
    var status: String = ""
    var supplierId: String = ""
    var type: String = ""
}

struct CreateFavouriteRequestLineItem: Codable {
    var name: String = ""
    var price: Float = 0.00
    var productId: String = ""
    var quantity: Int = 0
}

public struct CreateStandingOrder: Codable {
    var lineItems: [CreateOrderLineItem] = []
    var origin: String = ""
    var retailerId: String = ""
    var supplierId: String = ""
    var type: String = ""
}

public struct CreatePurchaserSchedule: Codable {
    var orderId: String = ""
    var place: Bool = true
    var retailerId: String = ""
    var startDate: String = ""
    var supplierId: String = ""
}

public struct UpdateOrderRequest: Codable {
    var lineItems: [UpdateOrderRequestLineItem] = []
    var name: String = ""
    var origin: String = ""
    var type: String = ""
}

public struct UpdateScheduleRequest: Codable {
    var cutOff: String = ""
    var purchaserScheduleId: String = ""
    var runAt: String = ""
    var scheduleId: String = ""
    var lineItems: [UpdateOrderRequestLineItem] = []
    var retailerId: String = ""
    var supplierId: String = ""
    var type: String = ""
}

struct UpdateOrderRequestLineItem: Codable {
    var productId: String = ""
    var quantity: Int = 0
}

extension OrderResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .link) ?? Links()
        data = try container.decodeIfPresent([Order].self, forKey: .data) ?? []
    }
}

extension ClassicStandingOrderResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .link) ?? Links()
        data = try container.decodeIfPresent([ClassicStandingOrder].self, forKey: .data) ?? []
    }
}

extension Order: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        canMarkAsPaid = try container.decodeIfPresent(Bool.self, forKey: .canMarkAsPaid) ?? false
        canMarkAsUnpaid = try container.decodeIfPresent(Bool.self, forKey: .canMarkAsUnpaid) ?? false
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        chargable = try container.decodeIfPresent(Bool.self, forKey: .chargable) ?? false
        chargedAt = try container.decodeIfPresent(String.self, forKey: .chargedAt) ?? ""
        chargedBy = try container.decodeIfPresent(String.self, forKey: .chargedBy) ?? ""
        chargedByUser = try container.decodeIfPresent(String.self, forKey: .chargedByUser) ?? ""
        comment = try container.decodeIfPresent(String.self, forKey: .comment) ?? ""
        completeAt = try container.decodeIfPresent(String.self, forKey: .completeAt) ?? ""
        color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        createdBy = try container.decodeIfPresent(String.self, forKey: .createdBy) ?? ""
        deliveryDate = try container.decodeIfPresent(String.self, forKey: .deliveryDate) ?? ""
        directProcessing = try container.decodeIfPresent(Bool.self, forKey: .directProcessing) ?? false
        display = try container.decodeIfPresent(Display.self, forKey: .display) ?? Display()
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        editable = try container.decodeIfPresent(Bool.self, forKey: .editable) ?? false
        freight = try container.decodeIfPresent(Float.self, forKey: .freight) ?? 0.00
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        invoice = try container.decodeIfPresent(Invoice.self, forKey: .invoice) ?? Invoice()
        invoiceId = try container.decodeIfPresent(String.self, forKey: .invoiceId) ?? ""
        invoiceNumber = try container.decodeIfPresent(String.self, forKey: .invoiceNumber) ?? ""
        invoiceReference = try container.decodeIfPresent(String.self, forKey: .invoiceReference) ?? ""
        isOutstanding = try container.decodeIfPresent(Bool.self, forKey: .isOutstanding) ?? false
        label = try container.decodeIfPresent(String.self, forKey: .label) ?? ""
        lineItems = try container.decodeIfPresent([LineItem].self, forKey: .lineItems) ?? []
        locked = try container.decodeIfPresent(Bool.self, forKey: .locked) ?? false
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        noPaymentActions = try container.decodeIfPresent(Bool.self, forKey: .noPaymentActions) ?? false
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        orderNumber = try container.decodeIfPresent(String.self, forKey: .orderNumber) ?? ""
        orderStatus = try container.decodeIfPresent(String.self, forKey: .orderStatus) ?? ""
        paidAt = try container.decodeIfPresent(String.self, forKey: .paidAt) ?? ""
        paidToSupplier = try container.decodeIfPresent(String.self, forKey: .paidToSupplier) ?? ""
        paymentDelay = try container.decodeIfPresent(Int.self, forKey: .paymentDelay) ?? 0
        paymentMethodType = try container.decodeIfPresent(PaymentMethodType.self, forKey: .paymentMethodType) ?? PaymentMethodType()
        paymentStatus = try container.decodeIfPresent(String.self, forKey: .paymentStatus) ?? ""
        placedByName = try container.decodeIfPresent(String.self, forKey: .placedByName) ?? ""
        processingError = try container.decodeIfPresent(String.self, forKey: .processingError) ?? ""
        properties = try container.decodeIfPresent(Properties.self, forKey: .properties) ?? Properties()
        randomWeight = try container.decodeIfPresent(Bool.self, forKey: .randomWeight) ?? false
        retailerAlias = try container.decodeIfPresent(String.self, forKey: .retailerAlias) ?? ""
        retailerEditable = try container.decodeIfPresent(Bool.self, forKey: .retailerEditable) ?? false
        retailerName = try container.decodeIfPresent(String.self, forKey: .retailerName) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        subtotal = try container.decodeIfPresent(Float.self, forKey: .subtotal) ?? 0.00
        supplier = try container.decodeIfPresent(Supplier.self, forKey: .supplier) ?? Supplier()
        total = try container.decodeIfPresent(Float.self, forKey: .total) ?? 0.00
        totalCost = try container.decodeIfPresent(Float.self, forKey: .totalCost) ?? 0.00
        totalDue = try container.decodeIfPresent(Float.self, forKey: .totalDue) ?? 0.00
        totalFreight = try container.decodeIfPresent(Float.self, forKey: .totalFreight) ?? 0.00
        totalGST = try container.decodeIfPresent(Float.self, forKey: .totalGST) ?? 0.00
        totalQuantity = try container.decodeIfPresent(Float.self, forKey: .totalQuantity) ?? 0.00
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        updatedByName = try container.decodeIfPresent(String.self, forKey: .updatedByName) ?? ""
    }
}

extension LineItem: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        SKU = try container.decodeIfPresent(String.self, forKey: .SKU) ?? ""
        batchCode = try container.decodeIfPresent(String.self, forKey: .batchCode) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        display = try container.decodeIfPresent(Display.self, forKey: .display) ?? Display()
        gst = try container.decodeIfPresent(String.self, forKey: .gst) ?? ""
        locked = try container.decodeIfPresent(Bool.self, forKey: .locked) ?? false
        looseCount = try container.decodeIfPresent(Int.self, forKey: .looseCount) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        packCount = try container.decodeIfPresent(Int.self, forKey: .packCount) ?? 0
        price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        product = try container.decodeIfPresent(Product.self, forKey: .product) ?? Product()
        productId = try container.decodeIfPresent(String.self, forKey: .productId) ?? ""
        properties = try container.decodeIfPresent(Properties.self, forKey: .properties) ??  Properties()
        quantity = try container.decodeIfPresent(Int.self, forKey: .quantity) ?? 0
        ratePrice = try container.decodeIfPresent(String.self, forKey: .ratePrice) ?? ""
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        tax = try container.decodeIfPresent(String.self, forKey: .tax) ?? ""
        taxable = try container.decodeIfPresent(Bool.self, forKey: .taxable) ?? false
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        totalWeight = try container.safeFloatDecode(forKey: .totalWeight) ?? 0
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        weight = try container.safeFloatDecode(forKey: .weight) ?? 0
    }
}

extension ClassicStandingOrder: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        remindedAt = try container.decodeIfPresent(String.self, forKey: .remindedAt) ?? ""
        placedAt = try container.decodeIfPresent(String.self, forKey: .placedAt) ?? ""
        place = try container.decodeIfPresent(Bool.self, forKey: .place) ?? false
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        schedule = try container.decodeIfPresent(ClassicStandingOrderSchedule.self, forKey: .schedule) ?? ClassicStandingOrderSchedule()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        activityEnded = try container.decodeIfPresent(Bool.self, forKey: .activityEnded) ?? false
        nextRunAt = try container.decodeIfPresent(String.self, forKey: .nextRunAt) ?? ""
        nextFinishAt = try container.decodeIfPresent(String.self, forKey: .nextFinishAt) ?? ""
        scheduleId = try container.decodeIfPresent(String.self, forKey: .scheduleId) ?? ""
        nextRunDate = try container.decodeIfPresent(String.self, forKey: .nextRunDate) ?? ""
        cancelled = try container.decodeIfPresent([String].self, forKey: .cancelled) ??  []
        updatedBy = try container.decodeIfPresent(ClassicStandingOrderUpdatedBy.self, forKey: .updatedBy) ?? ClassicStandingOrderUpdatedBy()
        nextRunCancelled = try container.decodeIfPresent(Bool.self, forKey: .nextRunCancelled) ?? false
        scheduleEnabled = try container.decodeIfPresent(Bool.self, forKey: .scheduleEnabled) ?? false
        startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        endDate = try container.decodeIfPresent(String.self, forKey: .endDate) ?? ""
    }
}

extension ClassicStandingOrderSchedule: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        cutOffTime = try container.decodeIfPresent(String.self, forKey: .cutOffTime) ?? ""
        editableUntil = try container.decodeIfPresent(Int.self, forKey: .editableUntil) ?? 0
        includeWeekends = try container.decodeIfPresent(Bool.self, forKey: .includeWeekends) ?? false
        recurrence = try container.decodeIfPresent(String.self, forKey: .recurrence) ?? ""
        frequency = try container.decodeIfPresent(String.self, forKey: .frequency) ?? ""
        deliveryDelay = try container.decodeIfPresent(Int.self, forKey: .deliveryDelay) ?? 0
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        recurrenceInfo = try container.decodeIfPresent(ClassicStandingOrderRecurrenceInfo.self, forKey: .recurrenceInfo) ?? ClassicStandingOrderRecurrenceInfo()
        escalationTime = try container.decodeIfPresent(String.self, forKey: .escalationTime) ?? ""
        firstReminder = try container.decodeIfPresent(String.self, forKey: .firstReminder) ?? ""
        enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? false
        lastFinishedAt = try container.decodeIfPresent(String.self, forKey: .lastFinishedAt) ?? ""
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? ""
        standingOrders = try container.decodeIfPresent(Bool.self, forKey: .standingOrders) ?? false
        supplier = try container.decodeIfPresent(ClassicStandingOrderSupplier.self, forKey: .supplier) ?? ClassicStandingOrderSupplier()
        lastStartedAt = try container.decodeIfPresent(String.self, forKey: .lastStartedAt) ?? ""
        defaultSchedule = try container.decodeIfPresent(Bool.self, forKey: .defaultSchedule) ?? false
        cutOffPassed = try container.decodeIfPresent(Bool.self, forKey: .cutOffPassed) ?? false
        nextRun = try container.decodeIfPresent([String].self, forKey: .nextRun) ?? []
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
    }
}

extension ClassicStandingOrderRecurrenceInfo: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        freq = try container.decodeIfPresent(String.self, forKey: .freq) ?? ""
        byhour = try container.decodeIfPresent(String.self, forKey: .byhour) ?? ""
        byminute = try container.decodeIfPresent(String.self, forKey: .byminute) ?? ""
        interval = try container.decodeIfPresent(String.self, forKey: .interval) ?? ""
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
    }
}

extension ClassicStandingOrderSupplier: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}

extension ClassicStandingOrderUpdatedBy: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
    }
}

extension Order: Equatable {
    static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.id == rhs.id
    }
}

extension LineItem: Equatable {
    static func == (lhs: LineItem, rhs: LineItem) -> Bool {
        return lhs.product.id == rhs.product.id
    }
}
