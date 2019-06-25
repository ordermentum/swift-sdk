//
//  AccountSettings.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct AccountSettings {
    public init() {}
    
    public var invoiceSetting: InvoiceSetting = InvoiceSetting()
    public var invoiceFrequency: InvoiceFrequency = InvoiceFrequency()
    public var dayStart: String = ""
    public var monthStart: String = ""
    public var paymentMethod: PaymentMethods = PaymentMethods()
    public var paymentTerms: PaymentTerms = PaymentTerms()
    public var insights: Insights = Insights()
    public var liquorLicenseRequired: Bool = false
    public var includeOrderUpdatesInReports: Bool = false
    public var randomWeight: Bool = false
    public var orderSchedule: String = ""
    public var flags: [String] = []
    public var weightType: String = ""
    public var orderPrefix: String = ""
    public var sendInvoice: Bool = false
    public var orderExports: OrderExports = OrderExports()
    public var deliveryDelay: Int = 0
    public var groupPayments: Bool = false
    public var invoicePrefix: String = ""
    public var invoiceStatus: String = ""
    public var productExports: ProductExports = ProductExports()
    public var includeWeekends: Bool = false
    public var retailerExports: RetailerExports = RetailerExports()
    public var invoiceEmailDelay: String = ""
    public var enableDeliveryDate: Bool = false
    public var defaultDeliveryDelay: Int = 0
    public var classicStandingOrders: Bool = false
    public var defaultSalesAccountCode: String = ""
}

extension AccountSettings: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        invoiceSetting = try container.decodeIfPresent(InvoiceSetting.self, forKey: .invoiceSetting) ?? InvoiceSetting()
        invoiceFrequency = try container.decodeIfPresent(InvoiceFrequency.self, forKey: .invoiceFrequency) ?? InvoiceFrequency()
        dayStart = try container.decodeIfPresent(String.self, forKey: .dayStart) ?? ""
        monthStart = try container.decodeIfPresent(String.self, forKey: .monthStart) ?? ""
        paymentMethod = try container.decodeIfPresent(PaymentMethods.self, forKey: .paymentMethod) ?? PaymentMethods()
        paymentTerms = try container.decodeIfPresent(PaymentTerms.self, forKey: .paymentTerms) ?? PaymentTerms()
        insights = try container.decodeIfPresent(Insights.self, forKey: .insights) ?? Insights()
        liquorLicenseRequired = try container.safeBoolDecode(forKey: .liquorLicenseRequired) ?? false
        includeOrderUpdatesInReports = try container.safeBoolDecode(forKey: .includeOrderUpdatesInReports) ?? false
        randomWeight = try container.safeBoolDecode(forKey: .randomWeight) ?? false
//        orderSchedule = try container.decodeIfPresent(String.self, forKey: .orderSchedule) ?? ""
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        weightType = try container.decodeIfPresent(String.self, forKey: .weightType) ?? ""
        orderPrefix = try container.decodeIfPresent(String.self, forKey: .orderPrefix) ?? ""
        sendInvoice = try container.safeBoolDecode(forKey: .sendInvoice) ?? false
        orderExports = try container.decodeIfPresent(OrderExports.self, forKey: .orderExports) ?? OrderExports()
        deliveryDelay = try container.safeIntDecode(forKey: .deliveryDelay) ?? 0
        groupPayments = try container.safeBoolDecode(forKey: .groupPayments) ?? false
        invoiceStatus = try container.decodeIfPresent(String.self, forKey: .invoiceStatus) ?? ""
        productExports = try container.decodeIfPresent(ProductExports.self, forKey: .productExports) ?? ProductExports()
        includeWeekends = try container.safeBoolDecode(forKey: .includeWeekends) ?? false
        retailerExports = try container.decodeIfPresent(RetailerExports.self, forKey: .retailerExports) ?? RetailerExports()
        invoiceEmailDelay = try container.decodeIfPresent(String.self, forKey: .invoiceEmailDelay) ?? ""
        enableDeliveryDate = try container.safeBoolDecode(forKey: .enableDeliveryDate) ?? false
        defaultDeliveryDelay = try container.safeIntDecode(forKey: .defaultDeliveryDelay) ?? 0
        classicStandingOrders = try container.safeBoolDecode(forKey: .classicStandingOrders) ?? false
        defaultSalesAccountCode = try container.decodeIfPresent(String.self, forKey: .defaultSalesAccountCode) ?? ""
    }
}
