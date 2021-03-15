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
    
    public var supplierId: String = ""
    public var retailerId: String = ""
    public var purchaserId: String = ""
    public var actions: [CartAction] = []
}

public struct CartAction: Codable {
    public init() { }

    public var action: String = ""
    public var productId: String = ""
    public var quantity: Int = 0
}
