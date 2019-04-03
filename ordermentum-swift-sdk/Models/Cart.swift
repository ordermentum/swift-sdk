//
//  Cart.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 20/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Cart {
    var deliveryDate: String?
    var lineItems: [CartLineItem]?
    var retailerId: String?
    var supplierId: String?
}

struct CartProduct {
    var product: Product
    var quantity: Int
}

struct CartOrder {
    var lineItems: [CartLineItem]?
    var supplierId: String?
    var retailerId: String?
    var deliveryDate: String?
    var comment: String?
    var reference: String?
    var status: String?
    var type: String?
    var paymentMethodId: String?
    var origin: String?
}

struct CartLineItem {
    var productId: String?
    var quantity: Int?
}

extension Cart: Encodable {
    func encode(to encoder: Encoder) throws {
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
    func encode(to encoder: Encoder) throws {
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
    func encode(to encoder: Encoder) throws {
        //Init Container
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //Encode Items
        try container.encode(productId, forKey: .productId)
        try container.encode(quantity, forKey: .quantity)
    }
}

extension CartProduct: Equatable {
    
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        return lhs.product.id == rhs.product.id
    }
}
