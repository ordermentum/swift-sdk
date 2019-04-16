//
//  Flags.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Flags {
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
}

extension Flags: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        findSupplier = try container.decodeIfPresent(Bool.self, forKey: .findSupplier) ?? false
        review = try container.decodeIfPresent(Bool.self, forKey: .review) ?? false
        dashboardProfile = try container.decodeIfPresent(Bool.self, forKey: .dashboardProfile) ?? false
        userInvite = try container.decodeIfPresent(Bool.self, forKey: .userInvite) ?? false
        popularProducts = try container.decodeIfPresent(Bool.self, forKey: .popularProducts) ?? false
        addons = try container.decodeIfPresent(Bool.self, forKey: .addons) ?? false
        homePopularProducts = try container.decodeIfPresent(Bool.self, forKey: .homePopularProducts) ?? false
        retailerSignup = try container.decodeIfPresent(Bool.self, forKey: .retailerSignup) ?? false
        addVenue = try container.decodeIfPresent(Bool.self, forKey: .addVenue) ?? false
        projectionsV2 = try container.decodeIfPresent(Bool.self, forKey: .projectionsV2) ?? false
    }
}
