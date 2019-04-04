//
//  ClosurePeriod.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct ClosurePeriodsResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [ClosurePeriod] = []
}

public struct ClosurePeriod: Encodable {
    var id: String = ""
    var name: String = ""
    var userId: String = ""
    var retailerId: String = ""
    var startDate: String = ""
    var endDate: String = ""
}

extension ClosurePeriodsResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([ClosurePeriod].self, forKey: .data) ?? []
    }
}

extension ClosurePeriod: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        endDate = try container.decodeIfPresent(String.self, forKey: .endDate) ?? ""
    }
}
