//
//  OrderDisplay.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 1/2/21.
//  Copyright © 2021 Ordermentum. All rights reserved.
//

import Foundation

public struct OrderDisplay: Encodable {
    public init() { }

    public var totalFreight: String = ""
    public var totalCost: String = ""
    public var totalGST: String = ""
    public var total: String = ""
    public var surcharge: String = ""
    public var totalDiscount: String = ""
    public var discountSavings: String = ""
    public var totalSponsoredDiscount: String = ""
    public var totalSupplierDiscount: String = ""
    public var deliveryDate: String?
    public var invoice: OrderInvoiceDisplay?
}

public struct OrderInvoiceDisplay: Encodable {
    public init() { }

    public var totalCost: String = ""
    public var totalFreight: String = ""
    public var subtotal: String = ""
    public var totalGST: String = ""
    public var totalDiscount: String = ""
    public var totalSavings: String = ""
    public var total: String = ""
    public var totalDue: String = ""
    public var surcharge: String = ""
    public var credit: String = ""
}

extension OrderDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        totalFreight = try container.decodeIfPresent(String.self, forKey: .totalFreight) ?? ""
        totalCost = try container.decodeIfPresent(String.self, forKey: .totalCost) ?? ""
        totalGST = try container.decodeIfPresent(String.self, forKey: .totalGST) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        surcharge = try container.decodeIfPresent(String.self, forKey: .surcharge) ?? ""
        totalDiscount = try container.decodeIfPresent(String.self, forKey: .totalDiscount) ?? ""
        discountSavings = try container.decodeIfPresent(String.self, forKey: .discountSavings) ?? ""
        totalSponsoredDiscount = try container.decodeIfPresent(String.self, forKey: .totalSponsoredDiscount) ?? ""
        totalSupplierDiscount = try container.decodeIfPresent(String.self, forKey: .totalSupplierDiscount) ?? ""
        deliveryDate = try container.decodeIfPresent(String.self, forKey: .deliveryDate)
        invoice = try container.decodeIfPresent(OrderInvoiceDisplay.self, forKey: .invoice)
    }
}

extension OrderInvoiceDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        totalCost = try container.decodeIfPresent(String.self, forKey: .totalCost) ?? ""
        totalFreight = try container.decodeIfPresent(String.self, forKey: .totalFreight) ?? ""
        subtotal = try container.decodeIfPresent(String.self, forKey: .subtotal) ?? ""
        totalGST = try container.decodeIfPresent(String.self, forKey: .totalGST) ?? ""
        totalDiscount = try container.decodeIfPresent(String.self, forKey: .totalDiscount) ?? ""
        totalSavings = try container.decodeIfPresent(String.self, forKey: .totalSavings) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
        totalDue = try container.decodeIfPresent(String.self, forKey: .totalDue) ?? ""
        surcharge = try container.decodeIfPresent(String.self, forKey: .surcharge) ?? ""
        credit = try container.decodeIfPresent(String.self, forKey: .credit) ?? ""
    }
}
