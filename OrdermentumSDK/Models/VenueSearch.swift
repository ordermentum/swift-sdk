//
//  VenueSearch.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 19/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueSearchResponse {
    public var data: [VenueSearch] = []
}

public struct VenueSearch {
    public init() {}
    
    public var id: String = ""
    public var legalName: String = ""
    public var tradingName: String = ""
    public var address: VenueAddress = VenueAddress()
}

extension VenueSearchResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent([VenueSearch].self, forKey: .data) ?? []
    }
}

extension VenueSearch: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id  = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        legalName  = try container.decodeIfPresent(String.self, forKey: .legalName) ?? ""
        tradingName  = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
        address  = try container.decodeIfPresent(VenueAddress.self, forKey: .address) ?? VenueAddress()
    }
}
