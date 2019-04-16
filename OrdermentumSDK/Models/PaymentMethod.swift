//
//  PaymentMethod.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct PaymentMethod {
    var account: String = ""
    var accountName: String = ""
    var bankConfigured: Bool = false
    var bsb: String = ""
    var cardConfigured: Bool = false
    var cardLast4Digits: String = ""
    var cardName: String = ""
    var cardType: String = ""
    var createdAt: String = ""
    var displayName: String = ""
    var firstName: String = ""
    var id: String = ""
    var isCard: Bool = false
    var isDirect: Bool = false
    var lastName: String = ""
    var maskedNumber: String = ""
    var name: String = ""
    var title: String = ""
    var type: String = ""
    var updatedAt: String = ""
}

public struct UpdatePaymentMethodRequest: Codable {
    var paymentMethodId: String = ""
    var defaultPaymentMethodType: String = ""
}

public struct CreateCardPaymentMethodRequest: Codable {
    var number: String = ""
    var issuer: String = ""
    var isCard: Bool = false
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String = ""
    var expiryMonth: String = ""
    var expiryYear: String = ""
    var cvv: String = ""
    var isDirect: Bool = false
    var defaultAll: Bool = false
    var userId: String = ""
}

public struct CreateDirectDebitPaymentMethodRequest: Codable {
    var accountName: String = ""
    var account: String = ""
    var bsb: String = ""
    var isDirect: Bool = false
    var type: String = ""
    var country: String = ""
    var currency: String = ""
    var defaultAll: Bool = false
    var terms: Bool = true
    var userId: String = ""
}

extension PaymentMethod: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        account = try container.decodeIfPresent(String.self, forKey: .account) ?? ""
        accountName = try container.decodeIfPresent(String.self, forKey: .accountName) ?? ""
        bankConfigured = try container.decodeIfPresent(Bool.self, forKey: .bankConfigured) ?? false
        bsb = try container.decodeIfPresent(String.self, forKey: .bsb) ?? ""
        cardConfigured = try container.decodeIfPresent(Bool.self, forKey: .cardConfigured) ?? false
        cardLast4Digits = try container.decodeIfPresent(String.self, forKey: .cardLast4Digits) ?? ""
        cardName = try container.decodeIfPresent(String.self, forKey: .cardName) ?? ""
        cardType = try container.decodeIfPresent(String.self, forKey: .cardType) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        isCard = try container.decodeIfPresent(Bool.self, forKey: .isCard) ?? false
        isDirect = try container.decodeIfPresent(Bool.self, forKey: .isDirect) ?? false
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        maskedNumber = try container.decodeIfPresent(String.self, forKey: .maskedNumber) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
