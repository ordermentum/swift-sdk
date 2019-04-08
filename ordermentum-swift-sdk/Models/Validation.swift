//
//  Validation.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

/** Request **/
public struct ValidationRequestBody: Codable {
    var deliveryDate: String = ""
    var lineItems: [ValidationRequestBodyLineItem] = []
    var retailerId: String = ""
    var supplierId: String = ""
    var type: String = ""
}

struct ValidationRequestBodyLineItem: Codable {
    var productId: String = ""
    var quantity: Int = 0
}

/** Response **/
struct Validation {
    var cart: ValidationCart = ValidationCart()
    var display: ValidationDisplay = ValidationDisplay()
    var lineItems: [ValidationLineItem] = []
    var cartErrorCount: Int = 0
    var cartWarningCount: Int = 0
    var cartInfoCount: Int = 0
    var lineItemErrorCount: Int = 0
    var lineItemWarningCount: Int = 0
    var lineItemInfosCount: Int = 0
    var totalCost: Float = 0.00
    var totalFreight: Float = 0.00
    var subtotal: Float = 0.00
    var totalGST: Float = 0.00
    var total: Float = 0.00
    var totalPaid: Float = 0.00
    var totalDue: Float = 0.00
    var totalFreightIncGST: Float = 0.00
}

struct ValidationCart {
    var errors: [ValidationError] = []
}

struct ValidationError {
    var message: String = ""
    var type: String = ""
}

struct ValidationDisplay {
    var totalFreight: String = ""
    var totalCost: String = ""
    var totalGST: String = ""
    var total: String = ""
}

struct ValidationLineItem {
    var productId: String = ""
    var errors: [ValidationError] = []
    var display: ValidationLineItemDisplay = ValidationLineItemDisplay()
    var locked: Bool = false
}

struct ValidationLineItemDisplay {
    var price: Float = 0.00
    var priceFromTotal: Float = 0.00
    var priceInc: Float = 0.00
    var subtotal: Float = 0.00
    var tax: Float = 0.00
    var total: Float = 0.00
}

extension Validation: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        cart = try container.decodeIfPresent(ValidationCart.self, forKey: .cart) ?? ValidationCart()
        display = try container.decodeIfPresent(ValidationDisplay.self, forKey: .display) ?? ValidationDisplay()
        lineItems = try container.decodeIfPresent([ValidationLineItem].self, forKey: .lineItems) ?? []
        cartErrorCount = try container.decodeIfPresent(Int.self, forKey: .cartErrorCount) ?? 0
        cartWarningCount = try container.decodeIfPresent(Int.self, forKey: .cartWarningCount) ?? 0
        cartInfoCount = try container.decodeIfPresent(Int.self, forKey: .cartInfoCount) ?? 0
        lineItemErrorCount = try container.decodeIfPresent(Int.self, forKey: .lineItemErrorCount) ?? 0
        lineItemWarningCount = try container.decodeIfPresent(Int.self, forKey: .lineItemWarningCount) ?? 0
        lineItemInfosCount = try container.decodeIfPresent(Int.self, forKey: .lineItemInfosCount) ?? 0
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0.00
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0.00
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0.00
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0.00
        total = try container.safeFloatDecode(forKey: .total) ?? 0.00
        totalPaid = try container.safeFloatDecode(forKey: .totalPaid) ?? 0.00
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0.00
        totalFreightIncGST = try container.safeFloatDecode(forKey: .totalFreightIncGST) ?? 0.00
    }
}

extension ValidationCart: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        errors = try container.decodeIfPresent([ValidationError].self, forKey: .errors) ?? []
    }
}

extension ValidationError: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}

extension ValidationDisplay: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        totalFreight = try container.decodeIfPresent(String.self, forKey: .totalFreight) ?? ""
        totalCost = try container.decodeIfPresent(String.self, forKey: .totalCost) ?? ""
        totalGST = try container.decodeIfPresent(String.self, forKey: .totalGST) ?? ""
        total = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
    }
}

extension ValidationLineItem: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        productId = try container.decodeIfPresent(String.self, forKey: .productId) ?? ""
        errors = try container.decodeIfPresent([ValidationError].self, forKey: .errors) ?? []
        display = try container.decodeIfPresent(ValidationLineItemDisplay.self, forKey: .display) ?? ValidationLineItemDisplay()
        locked = try container.decodeIfPresent(Bool.self, forKey: .locked) ?? false
    }
}

extension ValidationLineItemDisplay: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        price = try container.safeFloatDecode(forKey: .price) ?? 0
        priceFromTotal = try container.safeFloatDecode(forKey: .priceFromTotal) ?? 0
        priceInc = try container.safeFloatDecode(forKey: .priceInc) ?? 0
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0
        tax = try container.safeFloatDecode(forKey: .tax) ?? 0
        total = try container.safeFloatDecode(forKey: .total) ?? 0
    }
}
