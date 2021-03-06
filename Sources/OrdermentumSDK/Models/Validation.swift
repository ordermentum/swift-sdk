//
//  Validation.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

/** Request **/
public struct ValidationRequestBody: Codable {
    public init() { }

    public var id: String?
    public var deliveryDate: String = ""
    public var lineItems: [ValidationRequestBodyLineItem] = []
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var type: String = ""
    public var origin: String = "retailer"
    public var couponCode: String?
    public var cutOff: String?
    public var scheduleId: String?
    public var paymentMethodId: String?
}

public struct ValidationRequestBodyLineItem: Codable {
    public init() { }
    public init(productId: String, quantity: Int, id: String, variantId: String? = nil, comment: String? = nil) {
        self.productId = productId
        self.quantity = quantity
        self.id = id
        self.variantId = variantId
        self.comment = comment
    }
    public var id: String?
    public var productId: String = ""
    public var quantity: Int = 0
    public var variantId: String?
    public var comment: String?
}

/** Response **/
public struct Validation {
    public init() { }

    public var cart: ValidationCart = ValidationCart()
    public var discounts: [ValidationDiscount] = []
    public var display: ValidationDisplay = ValidationDisplay()
    public var lineItems: [ValidationLineItem] = []
    public var cartErrorCount: Int = 0
    public var cartWarningCount: Int = 0
    public var cartInfoCount: Int = 0
    public var lineItemErrorCount: Int = 0
    public var lineItemWarningCount: Int = 0
    public var lineItemInfosCount: Int = 0
    public var paymentOptions: [PaymentOption] = []
    public var totalCost: Float = 0.00
    public var totalFreight: Float = 0.00
    public var subtotal: Float = 0.00
    public var totalGST: Float = 0.00
    public var total: Float = 0.00
    public var totalPaid: Float = 0.00
    public var totalDue: Float = 0.00
    public var totalFreightIncGST: Float = 0.00
    public var surcharge: Float = 0.00
    public var dueAt: String = ""
    public var payOnPlace: Bool = false
}

public struct ValidationCart {
    public init() { }

    public var errors: [ValidationMessage] = []
    public var warnings: [ValidationMessage] = []
    public var infos: [ValidationMessage] = []
}

public struct ValidationDiscount {
    public init() { }

    public var name: String = ""
    public var sponsored: Bool = false
    public var hostId: String = ""
    public var description: String = ""
    public var effects: [ValidationDiscountEffect] = []
}

public struct ValidationDiscountEffect {
    public init() { }

    public var type: String = ""
    public var value: String = ""
    public var target: String = ""
}

public struct ValidationMessage {
    public init() { }

    public var message: String = ""
    public var type: String = ""
    public var id: String = ""
}

public struct ValidationDisplay {
    public var totalDiscount: String = ""
    public var totalFreight: String = ""
    public var totalCost: String = ""
    public var totalGST: String = ""
    public var total: String = ""
}

public struct ValidationLineItem {
    public var productId: String = ""
    public var variantId: String?
    public var errors: [ValidationMessage] = []
    public var warnings: [ValidationMessage] = []
    public var infos: [ValidationMessage] = []
    public var display: ValidationLineItemDisplay = ValidationLineItemDisplay()
    public var locked: Bool = false
    public var product: Product = Product()
    public var quantity: Float = 0
    public var comment: String?
    public var name: String?
}

public struct ValidationLineItemDisplay {
    public var price: Float = 0.00
    public var priceFromTotal: Float = 0.00
    public var priceInc: Float = 0.00
    public var subtotal: Float = 0.00
    public var tax: Float = 0.00
    public var total: Float = 0.00
    public var surcharge: Float = 0.00
    public var displayUOM: String = ""
    public var ratePrice: String = ""
}

extension Validation: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        cart = try container.decodeIfPresent(ValidationCart.self, forKey: .cart) ?? ValidationCart()
        discounts = try container.decodeIfPresent([ValidationDiscount].self, forKey: .discounts) ?? []
        display = try container.decodeIfPresent(ValidationDisplay.self, forKey: .display) ?? ValidationDisplay()
        lineItems = try container.decodeIfPresent([ValidationLineItem].self, forKey: .lineItems) ?? []
        cartErrorCount = try container.safeIntDecode(forKey: .cartErrorCount) ?? 0
        cartWarningCount = try container.safeIntDecode(forKey: .cartWarningCount) ?? 0
        cartInfoCount = try container.safeIntDecode(forKey: .cartInfoCount) ?? 0
        lineItemErrorCount = try container.safeIntDecode(forKey: .lineItemErrorCount) ?? 0
        lineItemWarningCount = try container.safeIntDecode(forKey: .lineItemWarningCount) ?? 0
        lineItemInfosCount = try container.safeIntDecode(forKey: .lineItemInfosCount) ?? 0
        paymentOptions = try container.decodeIfPresent([PaymentOption].self, forKey: .paymentOptions) ?? []
        totalCost = try container.safeFloatDecode(forKey: .totalCost) ?? 0.00
        totalFreight = try container.safeFloatDecode(forKey: .totalFreight) ?? 0.00
        subtotal = try container.safeFloatDecode(forKey: .subtotal) ?? 0.00
        totalGST = try container.safeFloatDecode(forKey: .totalGST) ?? 0.00
        total = try container.safeFloatDecode(forKey: .total) ?? 0.00
        totalPaid = try container.safeFloatDecode(forKey: .totalPaid) ?? 0.00
        totalDue = try container.safeFloatDecode(forKey: .totalDue) ?? 0.00
        totalFreightIncGST = try container.safeFloatDecode(forKey: .totalFreightIncGST) ?? 0.00
        surcharge = try container.safeFloatDecode(forKey: .surcharge) ?? 0.00
        dueAt = try container.decodeIfPresent(String.self, forKey: .dueAt) ?? ""
        payOnPlace = try container.safeBoolDecode(forKey: .payOnPlace) ?? false
    }
}

extension ValidationCart: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        errors = try container.decodeIfPresent([ValidationMessage].self, forKey: .errors) ?? []
        warnings = try container.decodeIfPresent([ValidationMessage].self, forKey: .warnings) ?? []
        infos = try container.decodeIfPresent([ValidationMessage].self, forKey: .infos) ?? []
    }
}

extension ValidationDiscount: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        sponsored = try container.decodeIfPresent(Bool.self, forKey: .sponsored) ?? false
        hostId = try container.decodeIfPresent(String.self, forKey: .hostId) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        effects = try container.decodeIfPresent([ValidationDiscountEffect].self, forKey: .effects) ?? []
    }
}

extension ValidationDiscountEffect: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        type = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        value = try container.decodeIfPresent(String.self, forKey: .sponsored) ?? ""
        target = try container.decodeIfPresent(String.self, forKey: .target) ?? ""
    }
}

extension ValidationMessage: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
    }
}

extension ValidationDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        totalDiscount = try container.decodeIfPresent(String.self, forKey: .totalDiscount) ?? ""
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
        infos = try container.decodeIfPresent([ValidationMessage].self, forKey: .infos) ?? []
        display = try container.decodeIfPresent(ValidationLineItemDisplay.self, forKey: .display) ?? ValidationLineItemDisplay()
        locked = try container.safeBoolDecode(forKey: .locked) ?? false
        product = try container.decodeIfPresent(Product.self, forKey: .product) ?? Product()
        quantity = try container.safeFloatDecode(forKey: .quantity) ?? 0
        comment = try container.decodeIfPresent(String.self, forKey: .comment) ?? nil
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        variantId = try container.decodeIfPresent(String.self, forKey: .variantId) ?? nil
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
        displayUOM = try container.decodeIfPresent(String.self, forKey: .displayUOM) ?? ""
        ratePrice = try container.decodeIfPresent(String.self, forKey: .ratePrice) ?? ""
    }
}

extension ValidationLineItem {
    var shouldBeLocked: Bool {
        //Check Errors
        for error: ValidationMessage in errors {
            if error.id == "LEAD_TIME" {
                return true
            }
        }

        return false
    }
}
