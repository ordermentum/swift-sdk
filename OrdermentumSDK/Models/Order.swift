//
//  Order.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct CreateOrder: Codable {
    public init() {}
    
    public var comment: String = ""
    public var deliveryDate: String = ""
    public var lineItems: [CreateOrderLineItem] = []
    public var origin: String = ""
    public var reference: String = ""
    public var retailerId: String = ""
    public var status: String = ""
    public var supplierId: String = ""
    public var tokenId: String = ""
    public var type: String = ""
    public var paymentMethodId: String = ""
}

public struct CreateOrderLineItem: Codable {
    public init() {}
    
    public var name: String = ""
    public var price: String = ""
    public var productId: String = ""
    public var quantity: Int = 0
}

public struct OrderResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Order] = []
}

public struct ClassicStandingOrderResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [ClassicStandingOrder] = []
}

public struct Order: Encodable {
    public init() {}
    
    public var canMarkAsPaid: Bool = false
    public var canMarkAsUnpaid: Bool = false
    public var cancelledAt: String = ""
    public var chargable: Bool = false
    public var chargedAt: String = ""
    public var chargedBy: String = ""
    public var chargedByUser: String = ""
    public var comment: String = ""
    public var completeAt: String = ""
    public var color: String = ""
    public var createdAt: String = ""
    public var createdBy: String = ""
    public var deliveryDate: String = ""
    public var directProcessing: Bool = false
    public var display: Display = Display()
    public var dueAt: String = ""
    public var editable: Bool = false
    public var freight: Float = 0.00
    public var id: String = ""
    public var invoice: Invoice = Invoice()
    public var invoiceId: String = ""
    public var invoiceNumber: String = ""
    public var invoiceReference: String = ""
    public var isOutstanding: Bool = false
    public var isRetailerEditable: Bool = false
    public var isUpdated: Bool = false
    public var label: String = ""
    public var lineItems: [LineItem] = []
    public var locked: Bool = false
    public var name: String = ""
    public var noPaymentActions: Bool = false
    public var number: String = ""
    public var orderNumber: String = ""
    public var orderStatus: String = ""
    public var paidAt: String = ""
    public var paidToSupplier: String = ""
    public var paymentDelay: Int = 0
    public var paymentMethodType: PaymentMethodType = PaymentMethodType()
    public var paymentStatus: String = ""
    public var placedByName: String = ""
    public var processingError: String = ""
    public var randomWeight: Bool = false
    public var retailerAlias: String = ""
    public var retailerEditable: Bool = false
    public var retailerName: String = ""
    public var status: String = ""
    public var subtotal: Float = 0.00
    public var supplier: Supplier = Supplier()
    public var total: Float = 0.00
    public var totalCost: Float = 0.00
    public var totalDue: Float = 0.00
    public var totalFreight: Float = 0.00
    public var totalGST: Float = 0.00
    public var totalQuantity: Float = 0.00
    public var type: String = ""
    public var updatedAt: String = ""
    public var updatedBy: UpdatedBy = UpdatedBy()
    public var updatedByName: String = ""
}

public struct LineItem: Encodable {
    public init() {}
    
    public var SKU: String = ""
    public var batchCode: String = ""
    public var createdAt: String = ""
    public var display: Display = Display()
    public var gst: String = ""
    public var looseCount: Int = 0
    public var locked: Bool = false
    public var name: String = ""
    public var orderId: String = ""
    public var packCount: Int = 0
    public var price: String = ""
    public var product: Product = Product()
    public var productId: String = ""
    public var quantity: Int = 0
    public var ratePrice: String = ""
    public var subtotal: String = ""
    public var tax: String = ""
    public var taxable: Bool = false
    public var total: String = ""
    public var totalWeight: Float = 0
    public var updatedAt: String = ""
    public var weight: Float = 0
}

public struct ClassicStandingOrder {
    public var id: String = ""
    public var name: String = ""
    public var alias: String = ""
    public var remindedAt: String = ""
    public var placedAt: String = ""
    public var place: Bool = false
    public var purchaserId: String = ""
    public var userId: String = ""
    public var orderId: String = ""
    public var supplierId: String = ""
    public var schedule: ClassicStandingOrderSchedule = ClassicStandingOrderSchedule()
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var activityEnded: Bool = false
    public var nextRunAt: String = ""
    public var nextFinishAt: String = ""
    public var scheduleId: String = ""
    public var nextRunDate: String = ""
    public var cancelled: [String] = []
    public var updatedBy: UpdatedBy = UpdatedBy()
    public var nextRunCancelled: Bool = false
    public var scheduleEnabled: Bool = false
    public var startDate: String = ""
    public var endDate: String = ""
}

public struct ClassicStandingOrderSchedule {
    public var id: String = ""
    public var name: String = ""
    public var alias: String = ""
    public var cutOffTime: String = ""
    public var editableUntil: Int = 0
    public var includeWeekends: Bool = false
    public var recurrence: String = ""
    public var frequency: String = ""
    public var deliveryDelay: Int = 0
    public var supplierId: String = ""
    public var userId: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var recurrenceInfo: ClassicStandingOrderRecurrenceInfo = ClassicStandingOrderRecurrenceInfo()
    public var escalationTime: String = ""
    public var firstReminder: String = ""
    public var enabled: Bool = false
    public var lastFinishedAt: String = ""
    public var supplierName: String = ""
    public var standingOrders: Bool = false
    public var supplier: ClassicStandingOrderSupplier = ClassicStandingOrderSupplier()
    public var lastStartedAt: String = ""
    public var defaultSchedule: Bool = false
    public var cutOffPassed: Bool = false
    public var nextRun: [String] = []
    public var timezone: String = ""
}

public struct ClassicStandingOrderRecurrenceInfo {
    public var freq: String = ""
    public var byhour: String = ""
    public var byminute: String = ""
    public var interval: String = ""
    public var timezone: String = ""
}

public struct ClassicStandingOrderSupplier {
    public var name: String = ""
}

public struct UpdatedBy: Encodable {
    public var firstName: String = ""
    public var lastName: String = ""
    public var fullName: String = ""
}

public struct CreateFavouriteRequest: Codable {
    public init() {}
    
    public var comment: String = ""
    public var deliveryDate: String = ""
    public var lineItems: [CreateFavouriteRequestLineItem] = []
    public var origin: String = ""
    public var reference: String = ""
    public var retailerId: String = ""
    public var status: String = ""
    public var supplierId: String = ""
    public var type: String = ""
}

public struct CreateFavouriteRequestLineItem: Codable {
    public init() {}
    
    public var name: String = ""
    public var price: Float = 0.00
    public var productId: String = ""
    public var quantity: Int = 0
}

public struct CreateStandingOrder: Codable {
    public init() {}
    
    public var lineItems: [CreateOrderLineItem] = []
    public var origin: String = ""
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var type: String = ""
}

public struct CreatePurchaserSchedule: Codable {
    public init() {}
    
    public var orderId: String = ""
    public var place: Bool = true
    public var retailerId: String = ""
    public var startDate: String?
    public var supplierId: String = ""
}

public struct UpdateOrderRequest: Codable {
    public init() {}
    
    public var lineItems: [UpdateOrderRequestLineItem] = []
    public var name: String = ""
    public var origin: String = ""
    public var type: String = ""
}

public struct UpdateScheduleRequest: Codable {
    public init() {}
    
    public var cutOff: String = ""
    public var purchaserScheduleId: String = ""
    public var runAt: String = ""
    public var scheduleId: String = ""
    public var lineItems: [UpdateOrderRequestLineItem] = []
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var type: String = ""
}

public struct UpdateOrderRequestLineItem: Codable {
    public init() {}
    
    public var productId: String = ""
    public var quantity: Int = 0
}

public struct InstalmentsResponse: Encodable {
    public init() {}
    
    public var success: Bool = false
    public var url: String = ""
}

extension OrderResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .link) ?? Links()
        data = try container.decodeIfPresent([Order].self, forKey: .data) ?? []
    }
}

extension ClassicStandingOrderResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .link) ?? Links()
        data = try container.decodeIfPresent([ClassicStandingOrder].self, forKey: .data) ?? []
    }
}

extension Order: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        canMarkAsPaid = try container.safeBoolDecode(forKey: .canMarkAsPaid) ?? false
        canMarkAsUnpaid = try container.safeBoolDecode(forKey: .canMarkAsUnpaid) ?? false
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        chargable = try container.safeBoolDecode(forKey: .chargable) ?? false
        chargedAt = try container.decodeIfPresent(String.self, forKey: .chargedAt) ?? ""
        chargedBy = try container.decodeIfPresent(String.self, forKey: .chargedBy) ?? ""
        chargedByUser = try container.decodeIfPresent(String.self, forKey: .chargedByUser) ?? ""
        comment = try container.decodeIfPresent(String.self, forKey: .comment) ?? ""
        completeAt = try container.decodeIfPresent(String.self, forKey: .completeAt) ?? ""
        color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        createdBy = try container.decodeIfPresent(String.self, forKey: .createdBy) ?? ""
        deliveryDate = try container.decodeIfPresent(String.self, forKey: .deliveryDate) ?? ""
        directProcessing = try container.safeBoolDecode(forKey: .directProcessing) ?? false
        display = try container.decodeIfPresent(Display.self, forKey: .display) ?? Display()
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        editable = try container.safeBoolDecode(forKey: .editable) ?? false
        freight = try container.safeFloatDecode(forKey: .freight) ?? 0.00
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        invoice = try container.decodeIfPresent(Invoice.self, forKey: .invoice) ?? Invoice()
        invoiceId = try container.decodeIfPresent(String.self, forKey: .invoiceId) ?? ""
        invoiceNumber = try container.decodeIfPresent(String.self, forKey: .invoiceNumber) ?? ""
        invoiceReference = try container.decodeIfPresent(String.self, forKey: .invoiceReference) ?? ""
        isOutstanding = try container.safeBoolDecode(forKey: .isOutstanding) ?? false
        isRetailerEditable = try container.safeBoolDecode(forKey: .isRetailerEditable) ?? false
        isUpdated = try container.safeBoolDecode(forKey: .isUpdated) ?? false
        label = try container.decodeIfPresent(String.self, forKey: .label) ?? ""
        lineItems = try container.decodeIfPresent([LineItem].self, forKey: .lineItems) ?? []
        locked = try container.safeBoolDecode(forKey: .locked) ?? false
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        noPaymentActions = try container.safeBoolDecode(forKey: .noPaymentActions) ?? false
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        orderNumber = try container.decodeIfPresent(String.self, forKey: .orderNumber) ?? ""
        orderStatus = try container.decodeIfPresent(String.self, forKey: .orderStatus) ?? ""
        paidAt = try container.decodeIfPresent(String.self, forKey: .paidAt) ?? ""
        paidToSupplier = try container.decodeIfPresent(String.self, forKey: .paidToSupplier) ?? ""
        paymentDelay = try container.safeIntDecode(forKey: .paymentDelay) ?? 0
        paymentMethodType = try container.decodeIfPresent(PaymentMethodType.self, forKey: .paymentMethodType) ?? PaymentMethodType()
        paymentStatus = try container.decodeIfPresent(String.self, forKey: .paymentStatus) ?? ""
        placedByName = try container.decodeIfPresent(String.self, forKey: .placedByName) ?? ""
        processingError = try container.decodeIfPresent(String.self, forKey: .processingError) ?? ""
        randomWeight = try container.safeBoolDecode(forKey: .randomWeight) ?? false
        retailerAlias = try container.decodeIfPresent(String.self, forKey: .retailerAlias) ?? ""
        retailerEditable = try container.safeBoolDecode(forKey: .retailerEditable) ?? false
        retailerName = try container.decodeIfPresent(String.self, forKey: .retailerName) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0.00
        supplier = try container.decodeIfPresent(Supplier.self, forKey: .supplier) ?? Supplier()
        total = try container.safeFloatDecode(forKey: .total) ?? 0.00
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0.00
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0.00
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0.00
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0.00
        totalQuantity = try container.safeFloatDecode(forKey: .totalQuantity) ?? 0.00
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        updatedBy = try container.decodeIfPresent(UpdatedBy.self, forKey: .updatedBy) ?? UpdatedBy()
        updatedByName = try container.decodeIfPresent(String.self, forKey: .updatedByName) ?? ""
    }
}

extension LineItem: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        SKU = try container.decodeIfPresent(String.self, forKey: .SKU) ?? ""
        batchCode = try container.decodeIfPresent(String.self, forKey: .batchCode) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        display = try container.decodeIfPresent(Display.self, forKey: .display) ?? Display()
        gst = try container.decodeIfPresent(String.self, forKey: .gst) ?? ""
        locked = try container.safeBoolDecode(forKey: .locked) ?? false
        looseCount = try container.safeIntDecode(forKey: .looseCount) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        packCount = try container.safeIntDecode(forKey: .packCount) ?? 0
        price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        product = try container.decodeIfPresent(Product.self, forKey: .product) ?? Product()
        productId = try container.decodeIfPresent(String.self, forKey: .productId) ?? ""
        quantity = try container.safeIntDecode(forKey: .quantity) ?? 0
        ratePrice = try container.decodeIfPresent(String.self, forKey: .ratePrice) ?? ""
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        tax = try container.decodeIfPresent(String.self, forKey: .tax) ?? ""
        taxable = try container.safeBoolDecode(forKey: .taxable) ?? false
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        totalWeight = try container.safeFloatDecode(forKey: .totalWeight) ?? 0
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        weight = try container.safeFloatDecode(forKey: .weight) ?? 0
    }
}

extension ClassicStandingOrder: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        remindedAt = try container.decodeIfPresent(String.self, forKey: .remindedAt) ?? ""
        placedAt = try container.decodeIfPresent(String.self, forKey: .placedAt) ?? ""
        place = try container.safeBoolDecode(forKey: .place) ?? false
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        schedule = try container.decodeIfPresent(ClassicStandingOrderSchedule.self, forKey: .schedule) ?? ClassicStandingOrderSchedule()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        activityEnded = try container.safeBoolDecode(forKey: .activityEnded) ?? false
        nextRunAt = try container.decodeIfPresent(String.self, forKey: .nextRunAt) ?? ""
        nextFinishAt = try container.decodeIfPresent(String.self, forKey: .nextFinishAt) ?? ""
        scheduleId = try container.decodeIfPresent(String.self, forKey: .scheduleId) ?? ""
        nextRunDate = try container.decodeIfPresent(String.self, forKey: .nextRunDate) ?? ""
        cancelled = try container.decodeIfPresent([String].self, forKey: .cancelled) ??  []
        updatedBy = try container.decodeIfPresent(UpdatedBy.self, forKey: .updatedBy) ?? UpdatedBy()
        nextRunCancelled = try container.safeBoolDecode(forKey: .nextRunCancelled) ?? false
        scheduleEnabled = try container.safeBoolDecode(forKey: .scheduleEnabled) ?? false
        startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        endDate = try container.decodeIfPresent(String.self, forKey: .endDate) ?? ""
    }
}

extension ClassicStandingOrderSchedule: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        cutOffTime = try container.decodeIfPresent(String.self, forKey: .cutOffTime) ?? ""
        editableUntil = try container.safeIntDecode(forKey: .editableUntil) ?? 0
        includeWeekends = try container.safeBoolDecode(forKey: .includeWeekends) ?? false
        recurrence = try container.decodeIfPresent(String.self, forKey: .recurrence) ?? ""
        frequency = try container.decodeIfPresent(String.self, forKey: .frequency) ?? ""
        deliveryDelay = try container.safeIntDecode(forKey: .deliveryDelay) ?? 0
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        recurrenceInfo = try container.decodeIfPresent(ClassicStandingOrderRecurrenceInfo.self, forKey: .recurrenceInfo) ?? ClassicStandingOrderRecurrenceInfo()
        escalationTime = try container.decodeIfPresent(String.self, forKey: .escalationTime) ?? ""
        firstReminder = try container.decodeIfPresent(String.self, forKey: .firstReminder) ?? ""
        enabled = try container.safeBoolDecode(forKey: .enabled) ?? false
        lastFinishedAt = try container.decodeIfPresent(String.self, forKey: .lastFinishedAt) ?? ""
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? ""
        standingOrders = try container.safeBoolDecode(forKey: .standingOrders) ?? false
        supplier = try container.decodeIfPresent(ClassicStandingOrderSupplier.self, forKey: .supplier) ?? ClassicStandingOrderSupplier()
        lastStartedAt = try container.decodeIfPresent(String.self, forKey: .lastStartedAt) ?? ""
        defaultSchedule = try container.safeBoolDecode(forKey: .defaultSchedule) ?? false
        cutOffPassed = try container.safeBoolDecode(forKey: .cutOffPassed) ?? false
        nextRun = try container.decodeIfPresent([String].self, forKey: .nextRun) ?? []
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
    }
}

extension ClassicStandingOrderRecurrenceInfo: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}

extension UpdatedBy: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
    }
}

extension InstalmentsResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        success = try container.safeBoolDecode(forKey: .success) ?? false
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}

extension Order: Equatable {
    public static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.id == rhs.id
    }
}

extension LineItem: Equatable {
    public static func == (lhs: LineItem, rhs: LineItem) -> Bool {
        return lhs.product.id == rhs.product.id
    }
}

extension Order {
    /**
     * Creates an instance of CreateFavouriteRequest from a given order object, supplierId and retailerId
     * Returns a CreateFavouriteRequest
     */
    public func toCreateFavouriteRequest(retailerId: String, supplierId: String) -> CreateFavouriteRequest {
        //Initialize Create Favourite Request
        var requestObject: CreateFavouriteRequest = CreateFavouriteRequest()
        
        //Add Line Items
        for lineItem in self.lineItems {
            //Create Line item
            var createFavouriteLineItem: CreateFavouriteRequestLineItem = CreateFavouriteRequestLineItem()
            createFavouriteLineItem.name = lineItem.product.name
            createFavouriteLineItem.price = Float(lineItem.product.formattedPrice) ?? 0
            createFavouriteLineItem.productId = lineItem.product.id
            createFavouriteLineItem.quantity = lineItem.quantity
            requestObject.lineItems.append(createFavouriteLineItem)
        }
        
        //Set Favourite Object
        requestObject.retailerId = retailerId
        requestObject.supplierId = supplierId
        requestObject.type = "template"
        
        return requestObject
    }
}
