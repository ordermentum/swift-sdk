//
//  Payment.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct PaymentTerms {
    var days: Bool = false
    var endOfWeek: Bool = false
    var endOfMonth: Bool = false
}

struct PaymentMethods {
    var other: Bool = false
    var creditCard: Bool = false
    var directDebit: Bool = false
}

extension PaymentTerms: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        days = try container.decodeIfPresent(Bool.self, forKey: .days) ?? false
        endOfWeek = try container.decodeIfPresent(Bool.self, forKey: .endOfWeek) ?? false
        endOfMonth = try container.decodeIfPresent(Bool.self, forKey: .endOfMonth) ?? false
    }
}

extension PaymentMethods: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        other = try container.decodeIfPresent(Bool.self, forKey: .other) ?? false
        creditCard = try container.decodeIfPresent(Bool.self, forKey: .creditCard) ?? false
        directDebit = try container.decodeIfPresent(Bool.self, forKey: .directDebit) ?? false
    }
}
