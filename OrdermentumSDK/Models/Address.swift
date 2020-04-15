//
//  Address.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Address: Encodable {
    public init() { }

    public var formatted: String = ""
    public var id: String? = nil
    public var name: String = ""
    public var number: String = ""
    public var type: String = ""
    public var description: String = ""
    public var street1: String = ""
    public var street2: String = ""
    public var suburb: String = ""
    public var state: String = ""
    public var postcode: String = ""
    public var country: String = ""
    public var latitude: Float = 0.0
    public var longitude: Float = 0.0
    public var addressableType: String = ""
}

extension Address: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        formatted = try container.decodeIfPresent(String.self, forKey: .formatted) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? nil
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        street1 = try container.decodeIfPresent(String.self, forKey: .street1) ?? ""
        street2 = try container.decodeIfPresent(String.self, forKey: .street2) ?? ""
        suburb = try container.decodeIfPresent(String.self, forKey: .suburb) ?? ""
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        postcode = try container.decodeIfPresent(String.self, forKey: .postcode) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        latitude = try container.safeFloatDecode(forKey: .latitude) ?? 0
        longitude = try container.safeFloatDecode(forKey: .longitude) ?? 0
        addressableType = try container.decodeIfPresent(String.self, forKey: .addressableType) ?? ""
    }
}
