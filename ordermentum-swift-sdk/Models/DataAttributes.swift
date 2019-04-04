//
//  DataAttributes.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct DataAttributesResponse {
    var data: DataAttributesArrays = DataAttributesArrays()
}

struct DataAttributesArrays {
    var pos: [String] = []
    var banking: [String] = []
    var accounting: [String] = []
    var venueTypes: [String] = []
    var tradingHours: TradingHours = TradingHours()
}

public struct DataAttributes: Encodable {
    var pos: String = ""
    var venue: String = ""
    var banking: String = ""
    var accounting: String = ""
    var venueTypes: String = ""
    var tradingHours: TradingHours = TradingHours()
}

public struct VenueOperationsUpdate: Codable {
    var pos: String = ""
    var banking: String = ""
    var accounting: String = ""
    var venue: String = ""
}

extension DataAttributesResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent(DataAttributesArrays.self, forKey: .data) ?? DataAttributesArrays()
    }
}

extension DataAttributes: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode bankingData
        pos = try container.decodeIfPresent(String.self, forKey: .pos) ?? ""
        banking = try container.decodeIfPresent(String.self, forKey: .banking) ?? ""
        accounting = try container.decodeIfPresent(String.self, forKey: .accounting) ?? ""
        venueTypes = try container.decodeIfPresent(String.self, forKey: .venueTypes) ?? ""
        tradingHours = try container.decodeIfPresent(TradingHours.self, forKey: .tradingHours) ?? TradingHours()
    }
}

extension DataAttributesArrays: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode bankingData
        pos = try container.decodeIfPresent([String].self, forKey: .pos) ?? []
        banking = try container.decodeIfPresent([String].self, forKey: .banking) ?? []
        accounting = try container.decodeIfPresent([String].self, forKey: .accounting) ?? []
        venueTypes = try container.decodeIfPresent([String].self, forKey: .venueTypes) ?? []
        tradingHours = try container.decodeIfPresent(TradingHours.self, forKey: .tradingHours) ?? TradingHours()
    }
}
