//
//  CartAction.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 5/1/21.
//  Copyright © 2021 Ordermentum. All rights reserved.
//

import Foundation

public enum CartActions: String {
    case add = "ADD"
    case remove = "REMOVE"
    case update = "UPDATE"
    case clear = "CLEAR"
}

public struct CartActionRequest: Codable {
    public init() { }
    
    var supplierId: String = ""
    var retailerId: String = ""
    var purchaserId: String = ""
    var actions: [CartAction] = []
}

public struct CartAction: Codable {
    public init() { }

    var action: String = ""
    var productId: String = ""
    var quantity: Int = 0
}
