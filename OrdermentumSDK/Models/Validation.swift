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
    public init() {}
    
    public var deliveryDate: String = ""
    public var lineItems: [ValidationRequestBodyLineItem] = []
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var type: String = ""
}

public struct ValidationRequestBodyLineItem: Codable {
    public init() {}
    public init(productId: String, quantity: Int) {
        self.productId = productId
        self.quantity = quantity
    }
    public var productId: String = ""
    public var quantity: Int = 0
}

/** Response **/
public struct Validation {
    public init() {}
    
    public var cart: ValidationCart = ValidationCart()
    public var display: ValidationDisplay = ValidationDisplay()
    public var lineItems: [ValidationLineItem] = []
    public var cartErrorCount: Int = 0
    public var cartWarningCount: Int = 0
    public var cartInfoCount: Int = 0
    public var lineItemErrorCount: Int = 0
    public var lineItemWarningCount: Int = 0
    public var lineItemInfosCount: Int = 0
    public var totalCost: Float = 0.00
    public var totalFreight: Float = 0.00
    public var subtotal: Float = 0.00
    public var totalGST: Float = 0.00
    public var total: Float = 0.00
    public var totalPaid: Float = 0.00
    public var totalDue: Float = 0.00
    public var totalFreightIncGST: Float = 0.00
    public var surcharge: Float = 0.00
}

public struct ValidationCart {
    public init() {}
    
    public var errors: [ValidationMessage] = []
    public var warnings: [ValidationMessage] = []
}

public struct ValidationMessage {
    public var message: String = ""
    public var type: String = ""
    public init() {}
}

public struct ValidationDisplay {
    public var totalFreight: String = ""
    public var totalCost: String = ""
    public var totalGST: String = ""
    public var total: String = ""
}

public struct ValidationLineItem {
    public var productId: String = ""
    public var errors: [ValidationMessage] = []
    public var warnings: [ValidationMessage] = []
    public var display: ValidationLineItemDisplay = ValidationLineItemDisplay()
    public var locked: Bool = false
}

public struct ValidationLineItemDisplay {
    public var price: Float = 0.00
    public var priceFromTotal: Float = 0.00
    public var priceInc: Float = 0.00
    public var subtotal: Float = 0.00
    public var tax: Float = 0.00
    public var total: Float = 0.00
    public var surcharge: Float = 0.00
}

extension Validation: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        cart = try container.decodeIfPresent(ValidationCart.self, forKey: .cart) ?? ValidationCart()
        display = try container.decodeIfPresent(ValidationDisplay.self, forKey: .display) ?? ValidationDisplay()
        lineItems = try container.decodeIfPresent([ValidationLineItem].self, forKey: .lineItems) ?? []
        cartErrorCount = try container.safeIntDecode(forKey: .cartErrorCount) ?? 0
        cartWarningCount = try container.safeIntDecode(forKey: .cartWarningCount) ?? 0
        cartInfoCount = try container.safeIntDecode(forKey: .cartInfoCount) ?? 0
        lineItemErrorCount = try container.safeIntDecode(forKey: .lineItemErrorCount) ?? 0
        lineItemWarningCount = try container.safeIntDecode(forKey: .lineItemWarningCount) ?? 0
        lineItemInfosCount = try container.safeIntDecode(forKey: .lineItemInfosCount) ?? 0
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0.00
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0.00
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0.00
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0.00
        total = try container.safeFloatDecode(forKey: .total) ?? 0.00
        totalPaid = try container.safeFloatDecode(forKey: .totalPaid) ?? 0.00
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0.00
        totalFreightIncGST = try container.safeFloatDecode(forKey: .totalFreightIncGST) ?? 0.00
        surcharge = try container.safeFloatDecode(forKey: .surcharge) ?? 0.00
    }
}

extension ValidationCart: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        errors = try container.decodeIfPresent([ValidationMessage].self, forKey: .errors) ?? []
        warnings = try container.decodeIfPresent([ValidationMessage].self, forKey: .warnings) ?? []
    }
}

extension ValidationMessage: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}

extension ValidationDisplay: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        productId = try container.decodeIfPresent(String.self, forKey: .productId) ?? ""
        errors = try container.decodeIfPresent([ValidationMessage].self, forKey: .errors) ?? []
        warnings = try container.decodeIfPresent([ValidationMessage].self, forKey: .warnings) ?? []
        display = try container.decodeIfPresent(ValidationLineItemDisplay.self, forKey: .display) ?? ValidationLineItemDisplay()
        locked = try container.safeBoolDecode(forKey: .locked) ?? false
    }
}

extension ValidationLineItemDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        price = try container.safeFloatDecode(forKey: .price) ?? 0
        priceFromTotal = try container.safeFloatDecode(forKey: .priceFromTotal) ?? 0
        priceInc = try container.safeFloatDecode(forKey: .priceInc) ?? 0
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0
        tax = try container.safeFloatDecode(forKey: .tax) ?? 0
        total = try container.safeFloatDecode(forKey: .total) ?? 0
        surcharge = try container.safeFloatDecode(forKey: .surcharge) ?? 0
    }
}
