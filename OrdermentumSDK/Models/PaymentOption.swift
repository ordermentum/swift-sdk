//
//  PaymentOption.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 25/11/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct PaymentOption: Encodable {
    public var plan: String = ""
    public var duration: Int = 0
    public var totalDue: String = ""
    public var amount: Float = 0.00
    public var label: String = ""
}

extension PaymentOption: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        plan = try container.decodeIfPresent(String.self, forKey: .plan) ?? ""
        duration = try container.safeIntDecode(forKey: .duration) ?? 0
        totalDue = try container.decodeIfPresent(String.self, forKey: .totalDue) ?? ""
        amount = try container.safeFloatDecode(forKey: .amount) ?? 0.00
        label = try container.decodeIfPresent(String.self, forKey: .label) ?? ""
    }
}
