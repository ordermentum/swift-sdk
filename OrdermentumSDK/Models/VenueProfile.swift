//
//  VenueProfile.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueProfile: Codable {
    var abn: String = ""
    var address: Address = Address()
    var billingAddress: Address = Address()
    var legalName: String = ""
    var tradingName: String = ""
}

struct Completion {
    var profilePercent: Int = 0
}

extension Completion: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        profilePercent = try container.decodeIfPresent(Int.self, forKey: .profilePercent) ?? 0
    }
}
