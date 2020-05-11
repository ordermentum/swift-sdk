//
//  Payment.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct PaymentTerms: Encodable {
    public var days: Bool = false
    public var endOfWeek: Bool = false
    public var endOfMonth: Bool = false
}

public struct PaymentMethods: Encodable {
    public var other: Bool = false
    public var creditCard: Bool = false
    public var directDebit: Bool = false
}

extension PaymentTerms: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        days = try container.safeBoolDecode(forKey: .days) ?? false
        endOfWeek = try container.safeBoolDecode(forKey: .endOfWeek) ?? false
        endOfMonth = try container.safeBoolDecode(forKey: .endOfMonth) ?? false
    }
}

extension PaymentMethods: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        other = try container.safeBoolDecode(forKey: .other) ?? false
        creditCard = try container.safeBoolDecode(forKey: .creditCard) ?? false
        directDebit = try container.safeBoolDecode(forKey: .directDebit) ?? false
    }
}
