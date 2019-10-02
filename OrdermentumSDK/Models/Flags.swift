//
//  Flags.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Flags {
    public init() {}
    
    public var findSupplier: Bool = false
    public var review: Bool = false
    public var dashboardProfile: Bool = false
    public var userInvite: Bool = false
    public var popularProducts: Bool = false
    public var addons: Bool = false
    public var homePopularProducts: Bool = false
    public var retailerSignup: Bool = false
    public var addVenue: Bool = false
    public var projectionsV2: Bool = false
    public var recommendedSuppliers: Bool = false
    public var paymentUpsellDialogCheckout: Bool = false
    public var paymentUpsellDialogCheckoutGiftCard: Bool = false
    public var paymentUpsellDialogInvoice: Bool = false
    public var pendingSuppliers: Bool = false
}

extension Flags: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        findSupplier = try container.safeBoolDecode(forKey: .findSupplier) ?? false
        review = try container.safeBoolDecode(forKey: .review) ?? false
        dashboardProfile = try container.safeBoolDecode(forKey: .dashboardProfile) ?? false
        userInvite = try container.safeBoolDecode(forKey: .userInvite) ?? false
        popularProducts = try container.safeBoolDecode(forKey: .popularProducts) ?? false
        addons = try container.safeBoolDecode(forKey: .addons) ?? false
        homePopularProducts = try container.safeBoolDecode(forKey: .homePopularProducts) ?? false
        retailerSignup = try container.safeBoolDecode(forKey: .retailerSignup) ?? false
        addVenue = try container.safeBoolDecode(forKey: .addVenue) ?? false
        projectionsV2 = try container.safeBoolDecode(forKey: .projectionsV2) ?? false
        recommendedSuppliers = try container.safeBoolDecode(forKey: .recommendedSuppliers) ?? false
        paymentUpsellDialogCheckout = try container.safeBoolDecode(forKey: .paymentUpsellDialogCheckout) ?? false
        paymentUpsellDialogCheckout = try container.safeBoolDecode(forKey: .paymentUpsellDialogCheckoutGiftCard) ?? false
        paymentUpsellDialogInvoice = try container.safeBoolDecode(forKey: .paymentUpsellDialogInvoice) ?? false
        pendingSuppliers = try container.safeBoolDecode(forKey: .pendingSuppliers) ?? false
    }
}
