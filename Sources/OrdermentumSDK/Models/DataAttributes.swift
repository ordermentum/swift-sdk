//
//  DataAttributes.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct DataAttributesResponse {
    public var data: DataAttributesArrays = DataAttributesArrays()
}

public struct DataAttributesArrays {
    public var pos: [String] = []
    public var banking: [String] = []
    public var accounting: [String] = []
    public var venueTypes: [String] = []
    public var tradingHours: TradingHours = TradingHours()
}

public struct DataAttributes: Encodable {
    public init() {}
    
    public var pos: String = ""
    public var venue: String = ""
    public var banking: String = ""
    public var accounting: String = ""
    public var venueTypes: String = ""
    public var tradingHours: TradingHours = TradingHours()
    public var promotedCategories: [String] = []
}

public struct VenueOperationsUpdate: Codable {
    public init() {}
    
    public var pos: String = ""
    public var banking: String = ""
    public var accounting: String = ""
    public var venue: String = ""
}

extension DataAttributesResponse: Decodable {
    public init(from decoder: Decoder) throws {
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
        venue = try container.decodeIfPresent(String.self, forKey: .venue) ?? ""
        banking = try container.decodeIfPresent(String.self, forKey: .banking) ?? ""
        accounting = try container.decodeIfPresent(String.self, forKey: .accounting) ?? ""
        venueTypes = try container.decodeIfPresent(String.self, forKey: .venueTypes) ?? ""
        tradingHours = try container.decodeIfPresent(TradingHours.self, forKey: .tradingHours) ?? TradingHours()
        promotedCategories = try container.decodeIfPresent([String].self, forKey: .promotedCategories) ?? []
    }
}

extension DataAttributesArrays: Decodable {
    public init(from decoder: Decoder) throws {
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
