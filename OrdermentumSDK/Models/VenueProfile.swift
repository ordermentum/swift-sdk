//
//  VenueProfile.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueProfile: Codable {
    public init() {}
    
    public var abn: String = ""
    public var address: Address = Address()
    public var billingAddress: Address = Address()
    public var legalName: String = ""
    public var tradingName: String = ""
}

public struct Completion {
    public init() {}
    
    public var profilePercent: Int = 0
}

extension Completion: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        profilePercent = try container.safeIntDecode(forKey: .profilePercent) ?? 0
    }
}
