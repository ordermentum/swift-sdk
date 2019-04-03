//
//  Flags.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Flags {
    var findSupplier: Bool = false
    var review: Bool = false
    var dashboardProfile: Bool = false
    var userInvite: Bool = false
    var popularProducts: Bool = false
    var addons: Bool = false
    var homePopularProducts: Bool = false
    var retailerSignup: Bool = false
    var addVenue: Bool = false
    var projectionsV2: Bool = false
}

extension Flags: Decodable {
    init(from decoder: Decoder) throws {
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
