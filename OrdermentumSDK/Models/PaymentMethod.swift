//
//  PaymentMethod.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct PaymentMethod {
    public var account: String = ""
    public var accountName: String = ""
    public var bankConfigured: Bool = false
    public var bsb: String = ""
    public var cardConfigured: Bool = false
    public var cardLast4Digits: String = ""
    public var cardName: String = ""
    public var cardType: String = ""
    public var createdAt: String = ""
    public var displayName: String = ""
    public var firstName: String = ""
    public var id: String = ""
    public var isCard: Bool = false
    public var isDirect: Bool = false
    public var lastName: String = ""
    public var maskedNumber: String = ""
    public var name: String = ""
    public var title: String = ""
    public var type: String = ""
    public var updatedAt: String = ""
}

public struct UpdatePaymentMethodRequest: Codable {
    public init() {}
    
    public var paymentMethodId: String = ""
    public var defaultPaymentMethodType: String = ""
}

public struct CreateCardPaymentMethodRequest: Codable {
    public init() {}
    
    public var number: String = ""
    public var issuer: String = ""
    public var isCard: Bool = false
    public var name: String = ""
    public var expiryMonth: String = ""
    public var expiryYear: String = ""
    public var cvv: String = ""
    public var isDirect: Bool = false
    public var defaultPayment: Bool = false
    public var defaultAll: Bool = false
    public var userId: String = ""
    public var user_id: String = ""
}

public struct CreateDirectDebitPaymentMethodRequest: Codable {
    public init() {}
    
    public var accountName: String = ""
    public var account: String = ""
    public var bsb: String = ""
    public var isDirect: Bool = false
    public var type: String = ""
    public var country: String = ""
    public var currency: String = ""
    public var defaultPayment: Bool = false
    public var defaultAll: Bool = false
    public var terms: Bool = true
    public var userId: String = ""
    public var user_id: String = ""
}

extension PaymentMethod: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        account = try container.decodeIfPresent(String.self, forKey: .account) ?? ""
        accountName = try container.decodeIfPresent(String.self, forKey: .accountName) ?? ""
        bankConfigured = try container.safeBoolDecode(forKey: .bankConfigured) ?? false
        bsb = try container.decodeIfPresent(String.self, forKey: .bsb) ?? ""
        cardConfigured = try container.safeBoolDecode(forKey: .cardConfigured) ?? false
        cardLast4Digits = try container.decodeIfPresent(String.self, forKey: .cardLast4Digits) ?? ""
        cardName = try container.decodeIfPresent(String.self, forKey: .cardName) ?? ""
        cardType = try container.decodeIfPresent(String.self, forKey: .cardType) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        isCard = try container.safeBoolDecode(forKey: .isCard) ?? false
        isDirect = try container.safeBoolDecode(forKey: .isDirect) ?? false
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        maskedNumber = try container.decodeIfPresent(String.self, forKey: .maskedNumber) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
