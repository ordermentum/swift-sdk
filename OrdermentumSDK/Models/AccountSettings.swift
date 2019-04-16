//
//  AccountSettings.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct AccountSettings {
    var invoiceSetting: InvoiceSetting = InvoiceSetting()
    var invoiceFrequency: InvoiceFrequency = InvoiceFrequency()
    var dayStart: String = ""
    var monthStart: String = ""
    var paymentMethod: PaymentMethods = PaymentMethods()
    var paymentTerms: PaymentTerms = PaymentTerms()
    var insights: Insights = Insights()
    var liquorLicenseRequired: Bool = false
    var includeOrderUpdatesInReports: Bool = false
    var randomWeight: Bool = false
    var orderSchedule: String = ""
    var flags: [String] = []
    var weightType: String = ""
    var orderPrefix: String = ""
    var sendInvoice: Bool = false
    var orderExports: OrderExports = OrderExports()
    var deliveryDelay: Int = 0
    var groupPayments: Bool = false
    var invoicePrefix: String = ""
    var invoiceStatus: String = ""
    var productExports: ProductExports = ProductExports()
    var includeWeekends: Bool = false
    var retailerExports: RetailerExports = RetailerExports()
    var invoiceEmailDelay: String = ""
    var enableDeliveryDate: Bool = false
    var defaultDeliveryDelay: Int = 0
    var classicStandingOrders: Bool = false
    var defaultSalesAccountCode: String = ""
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
        liquorLicenseRequired = try container.decodeIfPresent(Bool.self, forKey: .liquorLicenseRequired) ?? false
        includeOrderUpdatesInReports = try container.decodeIfPresent(Bool.self, forKey: .includeOrderUpdatesInReports) ?? false
        randomWeight = try container.decodeIfPresent(Bool.self, forKey: .randomWeight) ?? false
//        orderSchedule = try container.decodeIfPresent(String.self, forKey: .orderSchedule) ?? ""
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        weightType = try container.decodeIfPresent(String.self, forKey: .weightType) ?? ""
        orderPrefix = try container.decodeIfPresent(String.self, forKey: .orderPrefix) ?? ""
        sendInvoice = try container.decodeIfPresent(Bool.self, forKey: .sendInvoice) ?? false
        orderExports = try container.decodeIfPresent(OrderExports.self, forKey: .orderExports) ?? OrderExports()
        deliveryDelay = try container.decodeIfPresent(Int.self, forKey: .deliveryDelay) ?? 0
        groupPayments = try container.decodeIfPresent(Bool.self, forKey: .groupPayments) ?? false
        invoiceStatus = try container.decodeIfPresent(String.self, forKey: .invoiceStatus) ?? ""
        productExports = try container.decodeIfPresent(ProductExports.self, forKey: .productExports) ?? ProductExports()
        includeWeekends = try container.decodeIfPresent(Bool.self, forKey: .includeWeekends) ?? false
        retailerExports = try container.decodeIfPresent(RetailerExports.self, forKey: .retailerExports) ?? RetailerExports()
        invoiceEmailDelay = try container.decodeIfPresent(String.self, forKey: .invoiceEmailDelay) ?? ""
        enableDeliveryDate = try container.decodeIfPresent(Bool.self, forKey: .enableDeliveryDate) ?? false
        defaultDeliveryDelay = try container.safeIntDecode(forKey: .defaultDeliveryDelay) ?? 0
        classicStandingOrders = try container.decodeIfPresent(Bool.self, forKey: .classicStandingOrders) ?? false
        defaultSalesAccountCode = try container.decodeIfPresent(String.self, forKey: .defaultSalesAccountCode) ?? ""
    }
}
