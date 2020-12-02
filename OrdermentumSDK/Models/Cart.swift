//
//  Cart.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 20/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Cart {
    public init(deliveryDate: String?, lineItems: [CartLineItem]?, retailerId: String?, supplierId: String?) {}
    
    public var deliveryDate: String?
    public var lineItems: [CartLineItem]?
    public var retailerId: String?
    public var supplierId: String?
}

public struct CartProduct {
    public init() {}
    public init(product: Product, quantity: Int, comment: String? = nil) {
        self.product = product
        self.quantity = quantity
        self.comment = comment
    }
    public var product: Product = Product()
    public var quantity: Int = 0
    public var comment: String?
}

public struct CartOrder {
    public init() {}
    
    public var lineItems: [CartLineItem]?
    public var supplierId: String?
    public var retailerId: String?
    public var deliveryDate: String?
    public var comment: String?
    public var reference: String?
    public var status: String?
    public var type: String?
    public var paymentMethodId: String?
    public var origin: String?
}

public struct CartLineItem {
    public init() {}
    public init(productId: String?, quantity: Int?, comment: String?) {
        self.productId = productId
        self.quantity = quantity
        self.comment = comment
    }
    public var productId: String?
    public var quantity: Int?
    public var comment: String?
}

extension Cart: Encodable {
    public func encode(to encoder: Encoder) throws {
        //Init Container
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //Encode Items
        try container.encode(deliveryDate, forKey: .deliveryDate)
        try container.encode(lineItems, forKey: .lineItems)
        try container.encode(retailerId, forKey: .retailerId)
        try container.encode(supplierId, forKey: .supplierId)
    }
}

extension CartOrder: Encodable {
    public func encode(to encoder: Encoder) throws {
        //Init Container
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //Encode Items
        try container.encode(lineItems, forKey: .lineItems)
        try container.encode(supplierId, forKey: .supplierId)
        try container.encode(retailerId, forKey: .retailerId)
        try container.encode(deliveryDate, forKey: .deliveryDate)
        try container.encode(comment, forKey: .comment)
        try container.encode(reference, forKey: .reference)
        try container.encode(status, forKey: .status)
        try container.encode(type, forKey: .type)
        try container.encode(paymentMethodId, forKey: .paymentMethodId)
        try container.encode(origin, forKey: .origin)
    }
}

extension CartLineItem: Encodable {
    public func encode(to encoder: Encoder) throws {
        //Init Container
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //Encode Items
        try container.encode(productId, forKey: .productId)
        try container.encode(quantity, forKey: .quantity)
    }
}

extension CartProduct: Equatable, AnalyticsTrackable {
    public static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        return lhs.product.id == rhs.product.id
    }
    
    public var trackableProperties: [String: String]? {
        var properties: [String: String] = [:]
        properties["productId"] = product.id
        properties["productName"] = product.name
        return properties
    }
}
