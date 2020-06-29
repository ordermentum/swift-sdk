//
//  Token.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 29/6/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct TokenUpgradeRequest: Codable {
    public init() {}
    
    public var token: String = ""
}

public struct TokenUpgradeResponse {
    public var token: String?
}

extension TokenUpgradeResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        token  = try container.decodeIfPresent(String.self, forKey: .token)
    }
}
